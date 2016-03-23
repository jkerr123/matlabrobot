function searchWindow = getSupportWindow( image, x,y)
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here
%Hard coded values to 7. 




searchWindow = image(y-2:y+2, x-2:x+2);

end
