imageL = strcat(pwd,'/testL.jpg');
imageR = strcat(pwd,'/testR.jpg');

imageL = convertImage(imageL);
imageR = convertImage(imageR);

startX = 69;
startY = 10;

supportWindow = getSupportWindow(imageL, startX, startY, 3);

searchWindow = getSearchWindow(imageR, startX,startY,15);



%Searching for the closest match. 
closestMatch = [];
smallestSSD= [];
 xcord=[];
 ycord=[];

for y=1:15-3
   for x=1:15-3
     
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
     closestMatch
%     smallestSSD
    
   end
end

 xcord = startX + (xcord - 7)
 ycord = startY + (ycord -7)



%getSSD(supportWindow, supportWindow2)
 %imtool(imageL)
 %imtool(supportWindow)
 %imtool(searchWindow)
 %imtool(closestMatch)

   
    
    imwrite(supportWindow, strcat(pwd,'\testsss.jpg'));