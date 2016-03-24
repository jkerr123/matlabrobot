function supportWindow = getSupportWindow( image, x,y, size )
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here


size = (size-1)/2;
supportWindow = image(y-size:y+size, x-size:x+size);



end

