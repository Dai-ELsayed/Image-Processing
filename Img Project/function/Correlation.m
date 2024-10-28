function result = Correlation(im)
    [H, W] = size(im);
    result = zeros(H, W);
    
    filter=ones(7);
    filter=filter*(1/49);
    
    M = length(filter);
    k = (M-1) / 2;
    im = double(im);
    
    
    
    for i = 1+k:H-k
        for j = 1+k:W-k
            subimg = im(i-k:i+k, j-k:j+k);
            result(i, j) = sum(sum(subimg .* filter));
            
            if result(i, j) > 255
                result(i, j) = 255;
            elseif result(i, j) < 0
                result(i, j) = 0;
            end
        end
    end

    result = uint8(result);
    
    result = result(1+k:H-k, 1+k:W-k);
    imshow(result);
end
