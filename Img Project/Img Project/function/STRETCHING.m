function [ contrust ] = STRETCHING(img,new_min,new_max )
[H W L]=size(img);
contrust=zeros(H,W);
contrust=double(contrust);
old_min=min(min(img));
old_max=max(max(img));

 for i=1:H 
     for j=1:W
         contrust(i,j)=(((img(i,j)-old_min)/(old_max-old_min))*(new_max-new_min))+new_min;
         
     end
 end
   contrust=uint8(contrust); 

end

