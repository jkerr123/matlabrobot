function supportWindow = getSupportWindow( image, x,y, size )
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here


supportWindow = image(x:x+size-1, y:y+size-1)



end

