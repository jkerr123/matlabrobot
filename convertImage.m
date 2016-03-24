function finalImage = convertImage(fileName)    
    % prepare file name of next colour image to load


    image=imread(fileName);
    
    if size(image, 3)==3
    image = rgb2gray(image);
    end
    % resize to make all imgs uniform (100x100).
    % Some imgs in this set have a few rows or cols extra
%     [sr,sc] = size(image);
%     if sr > 150
%         image = image(1:150,:);  % if there are more than 155 rows, keep only the first 155
%     end
%     
%     if sc > 200
%         image = image(:,1:200);  % if there are more than 128 columns, keep only the first 128
%     end
      
    
    finalImage = image;
   
    
