function dispMap = DISP_MAP( imageL, imageR )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
dispMap = [];

for xL=2:4
    for yL=2:4
    supportWindow = getSupportWindow(imageL, xL, yL);    
        for xR=7:20
            for yR=7:20
                
                if imageR(xR, yR) ~= -1
                    searchWindow = getSearchWindow(imageR, xR,yR);
                    [pixelDisp, SSD, window] = PIXEL_DISP(searchWindow, supportWindow, xL, yL)
                end
            end
        end 
    end
end


