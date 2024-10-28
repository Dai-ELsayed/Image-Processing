function [ DFTIVT] = DFTandIVT( img,option )
if option==1
    
 %To transform img to freq
 x1=fft2(img);
 %Apply detail in center
 x2=fftshift(x1);
 %to show image and normalized 
 DFTIVT=abs(x2);
 DFTIVT=log(1+DFTIVT);
 DFTIVT=mat2gray(DFTIVT);
elseif option==2
    %first transform to DFT
    x=fft2(img);
    y=fftshift(x);
    %2nd inverse fourior transformation and normalize this image
    DFTIVT=fftshift(y);
    DFTIVT=ifft2(DFTIVT);
    DFTIVT=abs(DFTIVT);
    DFTIVT=mat2gray(DFTIVT);

    
end
end

