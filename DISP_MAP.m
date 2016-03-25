function dispMap = DISP_MAP(imageL, imageR, supportWindowSize, searchWindowSize, width, height, method, rectified)
%generates a disparty map from two input images


% empty matrix for the disparity map
dispMap = zeros(height, width);

% getting the size to pad each image by, in order to be able to check the
% edges without going out of bounds
imageLpad = (supportWindowSize - 1) / 2;
imageRpad=(searchWindowSize - 1) / 2;

%padding the left and right image
imageL = padarray(imageL,[imageLpad,imageLpad]);
imageR = padarray(imageR,[imageRpad,imageRpad]);

%converting the image to double for more precision?
imageL=im2double(imageL);
imageR=im2double(imageR);

%creating a progress bar
bar = waitbar(0, 'Generating Disparity Map...');

%looping through every pixel in the left image
%starting from 1+padding in order to begin at the actual image
% ending from width or height minus padding to avoid the end empty values
for xL=1+imageLpad:width-imageLpad
    for yL=1+imageLpad:height-imageLpad
        
        %getting the small support window
        supportWindow = getSupportWindow(imageL, xL, yL, supportWindowSize);
        
        %getting the search window
        searchWindow = getSearchWindow(imageR, xL + imageRpad , yL + imageRpad , searchWindowSize, supportWindowSize, rectified);       
        
        %finding the closest match and its disparity vector
        [pixelDisp, corVal, window] = PIXEL_DISP(searchWindow, supportWindow, xL, yL, supportWindowSize, imageRpad, method); 
    
        %writing the disparity vector to the disparity map
        dispMap(yL, xL) = pixelDisp(1,2);                
                       
           
           waitbar(xL / (width+imageLpad)) 
    end

end

%closing the progress bar
delete(bar)

end


