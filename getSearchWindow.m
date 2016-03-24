function searchWindow = getSearchWindow( image, x,y, size, supportSize, rectified )
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here

size = (size-1)/2;
supportSize = (supportSize - 1)/2;

if rectified == 1    
    searchWindow = image(y-supportSize:y+supportSize, x-size:x+size);

else
    searchWindow = image(y-size:y+size, x-size:x+size);
end

end
