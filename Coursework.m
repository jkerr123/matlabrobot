imageL = strcat(pwd,'/testL.jpg');
imageR = strcat(pwd,'/testR.jpg');

imageL = convertImage(imageL);
imageR = convertImage(imageR);

imageL = im2double(imageL);
imageR = im2double(imageR);

imageL = padarray(imageL,[1,1],-1);
imageR = padarray(imageR,[7,7], -1);

dispMap = DISP_MAP(imageL, imageR);         
        
        









   
    
