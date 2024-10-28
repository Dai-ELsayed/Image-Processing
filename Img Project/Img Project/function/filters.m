function [result] = filters(img, M,option)
[H, W] = size(img);
result = zeros(H, W);
k = (M-1) / 2;
img = double(img);

  for i = 1+k:H-k
     for j = 1+k:W-k
         if option==1
             %midpoint
        subimg = img(i-k:i+k, j-k:j+k);
        result(i, j) = 0.5*(min(min((subimg))) + max(max((subimg))));
     
         elseif option==2
            % maxfilter
         subimg = img(i-k:i+k, j-k:j+k);
       result(i, j) = max(max((subimg)));
         elseif option==3
             %minimum filter
              subimg = img(i-k:i+k, j-k:j+k);
            result(i, j) = min(min((subimg)));
         elseif option==4
             %median
             subimg = img(i-k:i+k, j-k:j+k);
             sorted = sort(reshape(subimg, [1, M.*M]));
             result(i, j) = median(sorted);
        
        
         end  
     end
     
  end
result = result(1+k:H-k, 1+k:W-k);
result = uint8(result);
figure,imshow(result);
end