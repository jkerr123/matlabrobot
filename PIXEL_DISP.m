function [DISP, smallestSSD, closestMatch] = PIXEL_DISP(searchWindow, supportWindow, startX, startY)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Searching for the closest match. 

 xcord=[];
 ycord=[];

closestMatch = [];
smallestSSD= [];
 
 % 3 because there is no padding at the moment
 % padding needs to be added
for y=2:15-3
   for x=2:15-3
     
    % gets the 3x3 grid from the search window to compare it to the left
    % image search window
      RightWindow  = getSupportWindow(searchWindow,x,y); 
      SSD = SUPPORT_CMP(supportWindow,RightWindow);
    
    if isempty(closestMatch)     
        closestMatch = RightWindow;
    end
    
    if isempty(smallestSSD) || SSD < smallestSSD
        smallestSSD = SSD;
        closestMatch = RightWindow;
        
  
        xcord = x;
        ycord = y;
    end
%     'Print'
%     closestMatch
%     smallestSSD
    
   end
end

 xcord = startX + (xcord - 7);
 ycord = startY + (ycord -7);
 
 x = startX - xcord;
 y = startY - ycord;


DISP =[x,y];
end

