function img_path = ui_image_input()

[FileName, PathName] = uigetfile({'*.png;*.jpeg;*.jpg','Select the image you want to encrypt.'});
%do image url, we could do that
%{'*.png;*.jpeg','Select the image you want to encrypt.'};
if isequal(FileName, 0)
    disp('User selected Cancel');
    img_path = ''; % empty string if cancel
else 
    disp(['User selected ', fullfile(PathName, FileName)]);
    img_path = fullfile(PathName, FileName); % full path of selected image
end
   
