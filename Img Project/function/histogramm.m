function [ histo ] = histogramm( img )
[H W L]=size(img);
histo=zeros(256,1);
for i=1:H
    for j=1:W
      histo(img(i,j)+1)=histo(img(i,j)+1)+1;
    end
end
bar(histo);

end

