function dispMap = DISP_MAP( imageL, imageR )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
dispMap = [];

for xL=170:230
    for yL=140:170
    supportWindow = getSupportWindow(imageL, xL, yL);    
        for xR=170:230
            for yR=140:170
                
                if imageR(xR, yR) ~= -1
                    searchWindow = getSearchWindow(imageR, xR,yR);
                    [pixelDisp, SSD, window] = PIXEL_DISP(searchWindow, supportWindow, xL, yL);
                   
                    dispMap(xR, yR) = SSD;
                    yR;
                end
            end
        end 
    end
    xL;
end


