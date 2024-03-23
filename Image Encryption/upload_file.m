% created 3/18/24 SN. Edited 3/18 CC

function img_path = upload_file()
%=== SUMMARY: creates & stores the name of path to a jpg, jpeg, or png file 
% selected by the user. This selection occurs in 'dialog_input', if user chooses
% to upload a file from their computer. Image then later stored/used as
% 'og_img' during encryption

% stores name of file & path; opens finder window & creates a dialog box 
[FileName, PathName] = uigetfile({'*.png;*.jpeg;*.jpg','Select the image you want to encrypt.'});


%do image url, we could do that
%{'*.png;*.jpeg','Select the image you want to encrypt.'};

% if nothing is chosen [was canceled], set img_path to an empty string
if isequal(FileName, 0)
    disp('User selected Cancel');
    img_path = ''; % empty string if cancel
    og_img = [];

else 
    disp(['User selected ', fullfile(PathName, FileName)]);
    img_path = fullfile(PathName, FileName);    % full path of selected image
    og_img = imread(im_path);
end
   





%%%ADD IF STATEMENT (here or in encrypted_img?) <-- almost def in encrypted
%%%img. Only call this function if the user actually inputs a file path

% goal: 1) if user chooses to upload an image, use this function [upload & use
% as og_img. 2) if user chooses to create own matrix directly, use that. 3)
% if user chooses to upload a link, use that
%%% for all of these inputs, if it exceeds a certain size [may need to test
%%% possible sizes] will be returned [saying og_img must be < __ x __
%%% pixels]

end
