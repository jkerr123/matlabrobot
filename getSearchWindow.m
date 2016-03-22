function searchWindow = getSupportWindow( image, x,y, size )
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here
%Hard coded values to 7. 

x = x + 7;
y = y + 7


searchWindow = image(y-7:y+7, x-7:x+7);

end
