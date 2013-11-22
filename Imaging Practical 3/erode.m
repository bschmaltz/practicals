function [ erosion ] = erode( image, edgesR, edgesC, struct )
    erosion=image;
    for i=1:size(edgesR,1)
        offset = (size(struct,1)-1)/2;
        erosion((edgesR(i)-offset):(edgesR(i)+offset), (edgesC(i)-offset):(edgesC(i)+offset))=erosion((edgesR(i)-offset):(edgesR(i)+offset), (edgesC(i)-offset):(edgesC(i)+offset))-struct;
    end
    erosion(erosion<0)=0;
end



