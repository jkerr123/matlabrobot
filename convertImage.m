function finalImage = convertImage(fileName)    
    % prepare file name of next colour image to load


    image=imread(fileName);

    % convert to monochrome by combining the RGB values 
    % according to the NTSC standard
    image = .2989*image(:,:,1)...
        +.5870*image(:,:,2)...
       +.1140*image(:,:,3);

    % resize to make all imgs uniform (100x100).
    % Some imgs in this set have a few rows or cols extra
    [sr,sc] = size(image);
    if sr > 300
        image = image(1:300,:);  % if there are more than 155 rows, keep only the first 155
    end
    
    if sc > 280
        image = image(:,1:280);  % if there are more than 128 columns, keep only the first 128
    end
      
    
    finalImage = image;
   
    
