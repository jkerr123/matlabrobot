imageL = strcat(pwd,'/testL.jpg');
imageR = strcat(pwd,'/testR.jpg');

imageL = convertImage(imageL);
imageL = padarray(imageL,[7,7]);
imageR = convertImage(imageR);
imageR = padarray(imageR,[7,7]);

startX = 2;
startY = 2;

supportWindow = getSupportWindow(imageL, startX, startY, 3);

searchWindow = getSearchWindow(imageR, startX,startY,15);

[pixelDisp, SSD, window] = PIXEL_DISP(searchWindow, supportWindow, startX, startY)

imageMap = getDispMap(pixelDisp,imageL,imageR);



   
    
