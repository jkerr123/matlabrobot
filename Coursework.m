imageL = convertImage('U:\MATLAB Projects\testL.jpg');
imageR = convertImage('U:\MATLAB Projects\testR.jpg');

supportWindow = getSupportWindow(imageL, 69, 10, 3);
supportWindow2 = getSupportWindow(imageR, 69, 10, 3);

searchWindow = getSearchWindow(imageL, 69,10,15);

getSSD(supportWindow, supportWindow2)

imtool(supportWindow)
imtool(searchWindow)

   
    
    imwrite(supportWindow, 'U:\MATLAB Projects\testsss.jpg');