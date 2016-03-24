function [DISP, smallestCorVal, closestMatch] = PIXEL_DISP(searchWindow, supportWindow, startX, startY, supportSize, searchCoordMap, method)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Searching for the closest match. 
closestMatch = [];
smallestCorVal= [];
 xcord=[];
 ycord=[];
 
 startingPoint = (supportSize + 1) / 2;

for y=startingPoint:size(searchWindow,1)-1
   for x=startingPoint:size(searchWindow,2)-1
     
    RightWindow  = getSupportWindow(searchWindow,x,y,3);  
    corVal = SUPPORT_CMP(supportWindow,RightWindow, method);
    
    if isempty(closestMatch)     
        closestMatch = RightWindow;
    end
    
    if isempty(smallestCorVal) || corVal < smallestCorVal
        smallestCorVal = corVal;
        closestMatch = RightWindow;
        
  
        xcord = x;
        ycord = y;
    end
%     'Print'
%     closestMatch
%     smallestSSD
    
   end
end

 
 
 x = searchCoordMap - xcord ;
 y = searchCoordMap - ycord ;


DISP =[y,x];
end

