function finalImage = convertImage(fileName)    

    image=imread(fileName);
    
    %If rgb then convert to greyscale
    if size(image, 3)==3
    image = rgb2gray(image);
    end
    
    finalImage = image;
   
    
