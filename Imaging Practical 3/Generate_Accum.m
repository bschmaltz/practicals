function Hough_Accum=Generate_Accum(Edge_image, Min_R, Max_R)
    [x y] = ind2sub(size(Edge_image), find(Edge_image(:) == 1));
    [h w] = size(Edge_image);
    theta = linspace(0, 2 * pi(), 500);
    R = Min_R:Max_R;

    Hough_Accum=zeros(h, w, length(R));
    for i = 1:length(R)
        for j = 1:length(x)
            r = R(i) * ones(1, 500);
            [cirx ciry] = pol2cart(theta, r);
            cirx = round(cirx + x(j));
            ciry = round(ciry + y(j));
            
            % Remove pixels outside of image
            ciry = ciry(cirx > 0 & cirx <= w);
            cirx = cirx(cirx > 0 & cirx <= w);
            cirx = cirx(ciry > 0 & ciry <= h);
            ciry = ciry(ciry > 0 & ciry <= h);
            
            for k = 1:length(cirx)
                Hough_Accum(ciry(k),cirx(k),i) = Hough_Accum(ciry(k),cirx(k),i) + 1/R(i);
            end
        end
        %rrange(i-Min_R+1)=int8(i);
    end   
end