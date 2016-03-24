function dispMap = DISP_MAP(imageL, imageR, supportWindowSize, searchWindowSize, width, height, method, rectified)

dispMap = zeros(height, width);

rectified = 1;

imageLpad = (supportWindowSize - 1) / 2;
imageRpad=(searchWindowSize - 1) / 2;

imageL = padarray(imageL,[imageLpad,imageLpad]);
imageR = padarray(imageR,[imageRpad,imageRpad]);

imageL=im2double(imageL);
imageR=im2double(imageR);

bar = waitbar(0, 'Generating Disparity Map...');

for xL=1+imageLpad:width+imageLpad-1
    for yL=1+imageLpad:height+imageLpad-1
        
        supportWindow = getSupportWindow(imageL, xL, yL, supportWindowSize);
        searchWindow = getSearchWindow(imageR, xL + imageRpad, yL + imageRpad, searchWindowSize, supportWindowSize, rectified);       
 
        [pixelDisp, corVal, window] = PIXEL_DISP(searchWindow, supportWindow, xL, yL, supportWindowSize, imageRpad, method); 

        dispMap(yL, xL) = pixelDisp(1,2);                
                       
           
           waitbar(xL / (width+imageLpad)) 
    end

end

delete(bar)
%imtool(dispMap,[])
end


