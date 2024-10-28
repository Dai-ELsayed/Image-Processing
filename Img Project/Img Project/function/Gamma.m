function [ result ] = Gamma( img,g)
[H W ]=size(img);
result=zeros(H,W);
img=im2double(img);
for i=1:H
    for j=1:W
        result(i,j)=(img(i,j))^g;
    end
end
result=im2uint8(result);


end

