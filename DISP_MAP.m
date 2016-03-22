function dispMap = DISP_MAP( imageL, imageR )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
dispMap = []

for xL=1:100
    for yL=1:100
    supportWindow = getSupportWindow(imageL, xL, yL, 3);    
        for xR=1:100
            for yR=1:100
            searchWindow = getSearchWindow(imageR, xR,yR,15);
            disp = PIXEL_DISP(searchWindow, supportWindow);
           
            end
        end 
    end
end


