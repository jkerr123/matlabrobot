function [DISP, smallestCorVal, closestMatch] = PIXEL_DISP(searchWindow, supportWindow, startX, startY, supportSize, searchCoordMap, method)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Searching for the closest match. 
closestMatch = [];
smallestCorVal= [];
 xcord=[];
 ycord=[];
 
 %setting the start and endpoints
 startingPoint = (supportSize - 1) / 2;
 endpointX = size(searchWindow,2)-1;
 endpointY = size(searchWindow,1)-1;

 %looping through the search window
for y=startingPoint+1:endpointY
   for x=startingPoint+1:endpointX
     
    % getting a window from our search window which is the same size as the support window   
    RightWindow  = getSupportWindow(searchWindow, x, y ,supportSize);  
    
    %comparing the two windows
    corVal = SUPPORT_CMP(supportWindow,RightWindow, method);
    
    %if this is the first comparison, set this window to the closest match
    if isempty(closestMatch)     
        closestMatch = RightWindow;
    end
    
    % if the correlation value is smaller than the current best, set the
    % best to the new value
    if isempty(smallestCorVal) || corVal < smallestCorVal
        smallestCorVal = corVal;
        closestMatch = RightWindow;        
        
        %get the coordinates of the new closest matching point
        xcord = x;
        ycord = y;
    end
    %if an exact match is found, exit the loop
    if corVal == 0
        break;
    end
   end
   if corVal == 0
       break;
   end
end

 
 %find the distance between the points
 x = searchCoordMap - xcord ;
 y = searchCoordMap - ycord ;



DISP =[y,x];
end

