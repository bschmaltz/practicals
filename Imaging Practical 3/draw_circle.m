function [ circle_image ] = draw_circle( radius, color )
circle_image = zeros(radius*2-1,radius*2-1)
for c=1:size(circle_image,2)
    y_lower_bound = round(radius-sqrt(radius^2-(c-radius)^2));
    y_upper_bound = round(radius+sqrt(radius^2-(c-radius)^2));
    for r=y_lower_bound+1:y_upper_bound-1
        circle_image(r,c)=255;
    end
end
end

