function supportWindow = getSupportWindow( image, x,y, size )
% gets a small support window from either the left image, or the search
% window


% changes the size variable to make sure our x,y coords are in the centre
% of the window
size = (size-1)/2;

supportWindow = image(y-size:y+size, x-size:x+size);



end

