function loadImage(fileName)    
    % prepare file name of next colour image to load


    f=imread(fileName);

    % convert to monochrome by combining the RGB values 
    % according to the NTSC standard
    face = .2989*f(:,:,1)...
        +.5870*f(:,:,2)...
        +.1140*f(:,:,3)

    % resize to make all imgs uniform (155x128).
    % Some imgs in this set have a few rows or cols extra
    [sr,sc] = size(face);
    if sr > 155
        face = face(1:155,:);  % if there are more than 155 rows, keep only the first 155
    end
    
    if sc > 128
        face = face(:,1:128);  % if there are more than 128 columns, keep only the first 128
    end
    
    % save monochrome image
    name = ...
        strcat('C:\Users\jamiekerr\Documents\face2')
    name = strcat(name, '.jpg');

    imwrite(face, name);
    
end  % for loop ends