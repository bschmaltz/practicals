image=rgb2gray(imread('part3_input.jpg'));
edge_image = edge(image, 'canny', 0.99);
[featR, featC] = find(edge_image);

%Part B: create squre of size 11 and disk of radius 6
s11 = zeros(11,11);
s11(:)=255;

c6 = draw_circle(6);
imshow(c6)