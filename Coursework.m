% imageL = strcat(pwd,'/testL.jpg');
% imageR = strcat(pwd,'/testR.jpg');

 %imageL = strcat(pwd,'/scene_l.bmp');
 %imageR = strcat(pwd,'/scene_r.bmp');
 
  imageL = strcat(pwd,'/coke_left.png');
 imageR = strcat(pwd,'/coke_right.png');

imageL = convertImage(imageL);
imageR = convertImage(imageR);


%[imageL,imageR] = rectifyStereoImages(imageL,imageR,stereoParams)

%imageL = im2int16(imageL);
%imageR = im2int16(imageR);


%imageL = int64(imageL)
%imageR = int64(imageR)

imageL = padarray(imageL,[1,1], -1);
imageR = padarray(imageR,[2,2], -1);

dispMap = DISP_MAP(imageL, imageR)  

imtool(imageL)
imtool(imageR)
dispMap = uint8(dispMap)
imtool(dispMap)
        
        









   
    
