imageL = strcat(pwd,'/im6.png');
imageR = strcat(pwd,'/im2.png');

imageL = convertImage(imageL);
imageR = convertImage(imageR);



%imageL = padarray(imageL,[1,1]);
%imageR = padarray(imageR,[7,7]);

dispMap = DISP_MAP(imageL, imageR); 

imtool(imageL)

imtool(imageR)
%dispMap = im2uint8(dispMap)
imtool(dispMap, [])
        
        









   
    
