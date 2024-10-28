function [ new_img ] = gaussian_noise( img,v,m,new_min,new_max )
%v=the gamma m=mean
img=double(img);
[H W L]=size(img);
new_img=zeros(H,W);
 for i=1:255
         num_of_pixel = round(((exp(-(i-m)^2 / (2*v*v))) / (sqrt(2*3.14*v*v)))*W*H);

     %x=((-(i-m)^2)/(2*v*v));
     %num_of_pixel=round((exp(x))/(sqrt((2*3.14*v*v))));
     for t=1:num_of_pixel
         row=ceil((rand(1,1)*H));
         colom=ceil((rand(1,1)*W));
         img(row,colom)=img(row,colom)+i;
         
     end
     
 end
  %for k=1:1
     % mn=(min(min(img(:,:,k))));
    %  mx=(max(max(img(:,:,k))));
   %   new_img(:,:,k)=((img(:,:,k)-mn)/(mx-mn))*255;
      
  %end
 
 
new_img=STRETCHING(img,new_min,new_max );

new_img=uint8(new_img);


end

