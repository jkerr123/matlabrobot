function dispMap = DISP_MAP( imageL, imageR )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
dispMap = [];

for xL=2:20
    for yL=2:15
    supportWindow = getSupportWindow(imageL, xL, yL);    
        for xR=8:20
            for yR=8:15
                
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


