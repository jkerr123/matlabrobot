imageL = strcat(pwd,'/testL.jpg');
imageR = strcat(pwd,'/testR.jpg');

imageL = convertImage(imageL);
imageR = convertImage(imageR);

startX = 69;
startY = 10;

supportWindow = getSupportWindow(imageL, startX, startY, 3);

searchWindow = getSearchWindow(imageR, startX,startY,15);




 
[pixelDisp, SSD, window] = PIXEL_DISP(searchWindow, supportWindow, startX, startY)
 
 
imageMap = getDispMap(pixelDisp,imageL,imageR);



   
    
