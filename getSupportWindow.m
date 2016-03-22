function supportWindow = getSupportWindow( image, x,y )
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here



%Hard coded to 1. 
supportWindow = image(y-1:y+1, x-1:x+1);

end

