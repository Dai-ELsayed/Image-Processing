function [result] = HistEqualiztion(im)
    [H, W] = size(im);
    count = zeros(256, 1);
    
    % first apply histogram
    for i=1:H
        for j=1:W
            count(im(i, j) + 1) = count(im(i, j) + 1) + 1;
        end
    end
    
    % find the probability
    p = count / (H*W);
    sumprob = zeros(256, 1);
    
    % sumtion of probability
    for i=1:256
        sumprob(i) = p(i);
        if i ~= 1
            sumprob(i) = sumprob(i) + sumprob(i - 1);
        end
    end
    
    % Mapping gray levels
    %s= Transformation function
    s = round(255*sumprob);
    
    result = zeros(H, W);
    for i=1:H
        for j=1:W
            result(i, j) = s(im(i, j) + 1);
        end
    end
    
    
    result = uint8(result);
end

