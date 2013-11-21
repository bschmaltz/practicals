function Hough_Accum=Generate_Accum(Edge_image, Min_R, Max_R)
    Hough_Accum=zeros(size(Edge_image,1), size(Edge_image,2), Max_R-Min_R+1);
    rrange=zeros(Max_R,Min_R);
    for i=Min_R:Max_R
        rrange(i-Min_R+1)=int8(i);
    end
    % get indices of non-zero features of b
    [featR, featC] = find(Edge_image);
    
    % set up accumulator array - with a margin to avoid need for bounds checking
    [nr, nc] = size(Edge_image);
    nradii = Min_R-Max_R+1;
    margin = Max_R;
    nrh = nr + 2*margin;        % increase size of accumulator
    nch = nc + 2*margin;
    h = zeros(nrh*nch*nradii, 1, 'uint32');  % 1-D for now, uint32 a touch faster

    % get templates for circles at all radii - these specify accumulator
    % elements to increment relative to a given feature
    tempR = []; tempC = []; tempRad = [];
    for i = Min_R:Max_R
        [tR, tC] = circlepoints(rrange(i));
        tempR = [tempR tR]; %#ok<*AGROW>
        tempC = [tempC tC];
        tempRad = [tempRad repmat(i, 1, length(tR))];
    end

    % Convert offsets into linear indices into h - this is similar to sub2ind.
    % Take care to avoid negative elements in either of these so can use
    % uint32, which speeds up processing by a factor of more than 3 (in version
    % 7.5.0.342)!
    tempInd = uint32( tempR+margin + nrh*(tempC+margin) + nrh*nch*(tempRad-1) );
    featInd = uint32( featR' + nrh*(featC-1)' );

    % Loop over features
    for f = featInd
        % shift template to be centred on this feature
        incI = tempInd + f;
        % and update the accumulator
        h(incI) = h(incI) + 1;
    end

    % Reshape h, convert to double, and apply options
    h = reshape(double(h), nrh, nch, nradii);

    
    h = bsxfun(@rdivide, h, reshape(rrange, 1, 1, length(rrange)));
end