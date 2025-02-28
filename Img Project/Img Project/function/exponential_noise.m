function [ noized_img ] = exponential_noise( img , a ,new_min,new_max)
% a  is the range of gray level to addd noize
img  = double(img);
[h , w , ~] = size(img);
noized_img = zeros(h,w);
% gray level between 1 to 255
for i=1:255
    % calculate the number of pixel to add noize
    no_of_pixel = round(a*(exp(-a*i)));
    for x = 1:no_of_pixel
        % select random pixel to add noize
        row = ceil(rand(1,1)*h);
        col = ceil(rand(1,1)*w);
        img(row,col) = img(row,col)+i;
    end
end
% normalization to pixel if the pexel greater than the range 255

noized_img=STRETCHING(img,new_min,new_max );

noized_img=uint8(noized_img);
end

