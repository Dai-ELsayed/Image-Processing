function [ noized_img ] = uniform_noize( img , a , b )
% a , b is the range of gray level to addd noize
img  = double(img);
[h , w , ~] = size(img);
noized_img = zeros(h,w);

% calculate the nmber of pixel to add noize
no_of_pixel = round((1/(b-a))*w*h);

for i=1:255

    for x = 1:no_of_pixel
        % select random pixel to add noize
        row = ceil(rand(1,1)*h);
        col = ceil(rand(1,1)*w);
        img(row,col) = img(row,col)+i;
    end
end

% normalization to pixel if the pexel greater than the range 255
for k = 1:1
    mn = min(min(img(:,:,k)));
    mx = max(max(img(:,:,k)));
    noized_img(:,:,k) = ((img(:,:,k)-mn)/(mx-mn))*255;
end
noized_img=uint8(noized_img);
imshow(noized_img)
end

