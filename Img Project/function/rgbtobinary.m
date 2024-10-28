function [ binary ] = rgbtobinary( rgb , threshold )
[H,W,~] = size(rgb);
gray = zeros(H,W);
gray = double(gray);
binary = zeros(H,W);

% first convert image to gray
for i=1:H
    for j=1:W
        % scale
        gray(i,j)=rgb(i,j,1)*0.4+rgb(i,j,2)*0.3+rgb(i,j,3)*0.3;
    end
end
gray = uint8(gray);
% second convert image to binary
for i=1:H
    for j=1:W
        if gray(i,j) > threshold
            binary(i,j)=1;
        end
        if gray(i,j) <= threshold
            binary(i,j)=0;
        end
    end
end
binary = logical(binary);


end

