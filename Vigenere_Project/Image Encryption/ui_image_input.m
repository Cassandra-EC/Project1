function logbox = ui_image_input(link)

%=== function opens a file selection

% uiimage places the image into a new file and returns it to the user in an
% 'image' object. Used to display a picture, icon, or logo in an app

% 

[image_file, image_path] = uigetfile{'*.png;*.jpeg','Select the image you want to encrypt.'};

if isequal(image_file, 0)
    disp('User selected Cancel');
else 
    disp(['User selected ', fullfile(image_path, image_file)]);
end
   

og_img = imread(fullfile(image_path, image_file));