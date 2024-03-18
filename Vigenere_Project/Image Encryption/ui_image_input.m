function read_img = get_ui_img ()

[FileName, PathName] = uigetfile({'*.png;*.jpeg','Select the image you want to encrypt.'})

%{'*.png;*.jpeg','Select the image you want to encrypt.'};
if isequal(FileName, 0)
    disp('User selected Cancel');
else 
    disp(['User selected ', fullfile(PathName, FileName)]);
end
   
