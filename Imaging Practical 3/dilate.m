function [ dilation ] = dilate( image, edgesR, edgesC, struct )
    dilation=image;
    for i=1:size(edgesR,1)
        offset = (size(struct,1)-1)/2;
        dilation((edgesR(i)-offset):(edgesR(i)+offset), (edgesC(i)-offset):(edgesC(i)+offset))=dilation((edgesR(i)-offset):(edgesR(i)+offset), (edgesC(i)-offset):(edgesC(i)+offset))+struct;
    end
    dilation(dilation>255)=255;
end

