function supportWindow = getSupportWindow( image, x,y, size )
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here

x = x + 1;
y = y + 1;

%Hard coded to 1. 
supportWindow = image(y-1:y+1, x-1:x+1);

end

