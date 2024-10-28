function [ result ] = Brightness_Darkness( img , op , k)

    img = double(img);
    %Darkness
    if op=='-'
        result = img - k;
    elseif op=='/'
        result = img / k;
    %Brightness
    elseif op=='+'
        result = img + k;
    elseif op=='*'
        result = img * k;
    end
    
    [H, W,L] = size(result);
    for i=1:H
        for j=1:W
            for k=1:L
            
                if result(i, j, k) > 255
                    result(i, j, k) = 255;
                elseif result(i, j, k) < 0
                    result(i, j, k) = 0;
                end
            end
        end
    end
    
    result = uint8(result);


end

