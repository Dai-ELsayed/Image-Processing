function [ noized_img ] = soltandpepper( img , ps , pp )
% ps ==> propability of solt
% pp ==> propability of pepper

[ h , w , ~] = size(img);
num_of_salt = round(ps*w*h);
num_of_pepper = round(pp*w*h);

% add solt noize to the image
for i=1:num_of_salt
    % select random pixel to add solt
    row = ceil(rand(1,1)*h);
    col = ceil(rand(1,1)*w);
    %salt noise=255
    img(row,col) = 255;
end

% add pepper noize to the image
for i=1:num_of_pepper
    % select random pixel to add pepper
    row = ceil(rand(1,1)*h);
    col = ceil(rand(1,1)*w);
    %pepper noise =0
    img(row,col) = 0;
end

noized_img = img;

end