function searchWindow = getSearchWindow( image, x,y)
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here
%Hard coded values to 7. 




searchWindow = image(y-1:y+1, x-1:x+15);

end
