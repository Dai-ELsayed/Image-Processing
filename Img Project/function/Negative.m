function [ Negative ] = NIGA(img)
[H W ]=size(img);
Negative=zeros(H,W);
img=im2double(img);
for i=1:H
    for j=1:W
        
            Negative(i,j)=1-img(i,j);
    end
        
        
            
end
    


Negative=im2uint8(Negative);
imshow(Negative);
end