function SSD = SUPPORT_CMP(searchWindow, supportWindow,x,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Searching for the closest match. 
closestMatch = [];
smallestSSD= [];
 xcord=[];
 ycord=[];

%The 3 is hard coded. 
for y=8:15-3
   for x=8:15-3
     
    RightWindow  = getSupportWindow(searchWindow,x,y,3);  
    SSD = getSSD(supportWindow,RightWindow);
    
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
 
 x = startX - xcord
 y = startY - ycord


DISP =[x,y];
end

