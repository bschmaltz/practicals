image=zeros(350, 350);
image(50:150, 50:150)=draw_circle(51);
image(51:150, 201:300)=255;
image(210:309, 50:289)=255;
image(210:259, 130:149)=0;
image(210:259, 200:219)=0;
edge_image = edge(image);
[featR, featC] = find(edge_image);

%Part B: create squre of size 11 and disk of radius 6
s11 = zeros(11,11);
s11(:)=255;

c6=draw_circle(6);

%Part C: dilte and errode with structures from part B
d_s11 = dilate(image, featR, featC, s11);
d_c6  = dilate(image, featR, featC, c6);

e_s11 = erode(image, featR, featC, s11);
e_c6  = erode(image, featR, featC, c6);

figure
subplot(2,3,1);
imshow(image),title('Original');
subplot(2,3,4);
imshow(edge_image),title('Edges (please zoom to see edges)');
subplot(2,3,2);
imshow(d_s11),title('dilated with square 11');
subplot(2,3,5);
imshow(e_s11),title('eroded with square 11');
subplot(2,3,3);
imshow(d_c6),title('dilated with cirlce 6');
subplot(2,3,6);
imshow(e_c6),title('eroded with cirlce 6');

%Part D: open and close the image
[featR_d_s11, featC_d_s11] = find(edge(d_s11));
[featR_e_s11, featC_e_s11] = find(edge(e_s11));
[featR_d_c6, featC_d_c6] = find(edge(d_c6));
[featR_e_c6, featC_e_c6] = find(edge(e_c6));

close_s11 = erode(d_s11, featR_d_s11, featC_d_s11, s11);
open_s11  = dilate(e_s11, featR_e_s11, featC_e_s11, s11);
close_c6  = erode(d_c6, featR_d_c6, featC_d_c6, c6);
open_c6   = dilate(e_c6, featR_e_c6, featC_e_c6, c6);

figure
subplot(2,2,1);
imshow(close_s11),title('Close with Square 11');
subplot(2,2,3);
imshow(open_s11),title('Open with Square 11');
subplot(2,2,2);
imshow(close_c6),title('Close with Circle 6');
subplot(2,2,4);
imshow(open_c6),title('Open with Circle 6');

%Part E: repeat for square of size 17 and 21, and for circle of size 8 and
%10.
%create shapes
s17 = zeros(17,17);
s17(:)=255;
s21 = zeros(21,21);
s21(:)=255;
c8=draw_circle(8);
c10=draw_circle(10);

%dilate and erode with each once
d_s17 = dilate(image, featR, featC, s17);
d_s21 = dilate(image, featR, featC, s21);
d_c8  = dilate(image, featR, featC, c8);
d_c10 = dilate(image, featR, featC, c10);

e_s17 = erode(image, featR, featC, s17);
e_s21 = erode(image, featR, featC, s21);
e_c8  = erode(image, featR, featC, c8);
e_c10 = erode(image, featR, featC, c10);

figure
subplot(2,4,1);
imshow(d_s17),title('dilated with square 17');
subplot(2,4,5);
imshow(e_s17),title('eroded with square 17');
subplot(2,4,2);
imshow(d_s21),title('dilated with square 21');
subplot(2,4,6);
imshow(e_s21),title('eroded with square 21');
subplot(2,4,3);
imshow(d_c8),title('dilated with cirlce 8');
subplot(2,4,7);
imshow(e_c8),title('eroded with cirlce 8');
subplot(2,4,4);
imshow(d_c10),title('dilate with cirlce 10');
subplot(2,4,8);
imshow(e_c10),title('eroded with cirlce 10');

%open and close
[featR_d_s17, featC_d_s17] = find(edge(d_s17));
[featR_e_s17, featC_e_s17] = find(edge(e_s17));
[featR_d_s21, featC_d_s21] = find(edge(d_s21));
[featR_e_s21, featC_e_s21] = find(edge(e_s21));
[featR_d_c8, featC_d_c8] = find(edge(d_c8));
[featR_e_c8, featC_e_c8] = find(edge(e_c8));
[featR_d_c10, featC_d_c10] = find(edge(d_c10));
[featR_e_c10, featC_e_c10] = find(edge(e_c10));

close_s17 = erode(d_s17, featR_d_s17, featC_d_s17, s17);
open_s17  = dilate(e_s17, featR_e_s17, featC_e_s17, s17);
close_s21 = erode(d_s21, featR_d_s21, featC_d_s21, s21);
open_s21  = dilate(e_s21, featR_e_s21, featC_e_s21, s21);
close_c8  = erode(d_c8, featR_d_c8, featC_d_c8, c8);
open_c8   = dilate(e_c8, featR_e_c8, featC_e_c8, c8);
close_c10  = erode(d_c10, featR_d_c10, featC_d_c10, c10);
open_c10   = dilate(e_c10, featR_e_c10, featC_e_c10, c10);

figure
subplot(2,4,1);
imshow(close_s17),title('Close with Square 17');
subplot(2,4,5);
imshow(open_s17),title('Open with Square 17');
subplot(2,4,2);
imshow(close_s21),title('Close with Square 21');
subplot(2,4,6);
imshow(open_s21),title('Open with Square 21');
subplot(2,4,3);
imshow(close_c8),title('Close with Circle 8');
subplot(2,4,7);
imshow(open_c8),title('Open with Circle 8');
subplot(2,4,4);
imshow(close_c10),title('Close with Circle 10');
subplot(2,4,8);
imshow(open_c10),title('Open with Circle 10');

%Part f
%The opening operation erodes the original image, and then, takes that
%resulting image and dilates it.

%The closing operation dilates the original image, and then, takes that
%restuling imate and erodes it.

%Since opening erodes first, smaller white spaces are more easily lost because
%the erosion could elimnate them, and then, the following dilate will not 
%will not expand these blacked out pixels.

%Conversly, since closing dilates first, smaller black spaces are more
%easily lost because the dilation of white spaces can whites out these small
%black spaces, and they will not be reformed in the following errosion
%step.

%Part G
%For a opening operation you will need to use a shape of size 26. Circle or
%square will work. The code below is using a cirlce
image2=zeros(500,500);
image2(75:424, 75:424)=image;
[featR2, featC2] = find(edge(image2));
c50=draw_circle(26);
e_c50 = erode(image2, featR2, featC2, c50);
[featR_e_c50, featC_e_c50] = find(edge(e_c50));
open_c50   = dilate(e_c50, featR_e_c50, featC_e_c50, c50);
figure
imshow(e_c50),title('Open with Circle 26, splits bottom box');

%For a closing operation you cannot split this black because you are
%forced to dilate first. As stated in part F, closing eleminates smaller
%black spaces, and strengthens dominate white spaces.  Because this block
%is primarily white you cannot eliminate any of the white features, i.e.
%split the block.