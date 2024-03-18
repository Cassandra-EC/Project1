[image_file, image_path] = uigetfile{'*.png;*.jpeg','Select the image you want to encrypt.'};
if isequal(image_file, 0)
    disp('User selected Cancel');
else 
    disp(['User selected ', fullfile(image_path, image_file)]);
end
   

og_img = imread(fullfile(image_path, image_file));