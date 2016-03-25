function searchWindow = getSearchWindow( image, x,y, size, supportSize, rectified )
% gets a window to search in from the right image


% changes the size variable to make sure our x,y coords are in the centre
% of the window
size = (size-1)/2;
supportSize = (supportSize - 1)/2;

% if the image has been rectified then don't search around the Y axis
if rectified == 1    
    searchWindow = image(y-supportSize:y+supportSize, x-size:x+size);
else
    searchWindow = image(y-size:y+size, x-size:x+size);
end

end
