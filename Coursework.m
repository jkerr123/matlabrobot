imageL = strcat(pwd,'/testL.jpg');
imageR = strcat(pwd,'/testR.jpg');

imageL = convertImage(imageL);
imageR = convertImage(imageR);

%imageL = im2int16(imageL);
%imageR = im2int16(imageR);


%imageL = int64(imageL)
%imageR = int64(imageR)

imageL = padarray(imageL,[1,1],-1);
imageR = padarray(imageR,[7,7], -1);

dispMap = DISP_MAP(imageL, imageR);  

imtool(dispMap)
        
        









   
    
