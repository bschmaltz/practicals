function Hough_Accum=Generate_Accum(Edge_image, Min_R, Max_R)
    Hough_Accum=zeros(size(Edge_image,1), size(Edge_image,2), Max_R-Min_R+1);
    rrange=zeros(Max_R,Min_R);
    [x y] = ind2sub(size(Edge_image), find(Edge_image(:) == 1));
    for i=Min_R:Max_R
        
        rrange(i-Min_R+1)=int8(i);
    end
    % get indices of non-zero features of blue
    [featR, featC] = find(Edge_image);
    
end