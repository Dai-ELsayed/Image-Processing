function [ gray ] = RGBTOGRAY( RGB, option )
[H,W,~] = size(RGB);
gray = zeros(H,W);
gray = double(gray);
for i=1:H
    for j=1:W
        % avarage
        if option == 1
        gray(i,j)=(RGB(i,j,1)+RGB(i,j,2)+RGB(i,j,3))/3;
        end
        % scale
        if option == 2
        gray(i,j)=RGB(i,j,1)*0.4+RGB(i,j,2)*0.3+RGB(i,j,3)*0.3;
        end
        % red
        if option == 3
        gray(i,j)=RGB(i,j,1);
        end
        % green
        if option == 4
        gray(i,j)=RGB(i,j,2);
        end
        % blue
        if option == 5
        gray(i,j)=RGB(i,j,3);
        end
    end
end
gray = uint8(gray);
end

