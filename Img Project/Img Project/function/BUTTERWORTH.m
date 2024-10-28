function [ NI ] = BUTTERWORTH( img,D0,index )
[H W L]=size(img);
filter=zeros(H,W,L);
 for x=1:H
    for y=1:W
        %D(u,v)===distance to center
        dis=sqrt((x-(H/2)).^2+(y-(W/2)).^2);
        filter(x,y)=(1/(1+(dis/D0)^2));
        if(dis<=D0)
            filter(x,y)=1;
        else
            filter(x,y)=0;
        end
    end
 end
  if index==0
      %Butterworth lowpass
      filter=filter;
  else
      %highpass
      filter=1-filter;
  end
  %DFT
  a=fft2(img);
  a=fftshift(a);
  %compute real part alone and imagin alone
  reall=real(a);
  imagin=imag(a);
  %multipply each part by filter
  nreal=filter.*reall;
  nimag=filter.*imagin;
  %%%
  NI=nreal(:,:)+i*nimag(:,:);
  %Inverse FT
  NI=fftshift(NI);
  NI=ifft2(NI);
  NI=abs(NI);
  NI=log(NI);
  NI=mat2gray(NI);


end