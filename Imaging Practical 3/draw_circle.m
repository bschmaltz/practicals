function [ circle_image ] = draw_circle( r )
circle_image = zeros(r*2-1,r*2-1)
for c=size(circle_image,1):size(circle_image,2)
    y_lower_bound = round(r-sqrt(r^2-(c-r)^2));
    y_upper_bound = round(r+sqrt(r^2-(c-r)^2));
    for r=y_lower_bound+1:y_upper_bound-1
        circle_image(r,c)=255;
    end
end
end

