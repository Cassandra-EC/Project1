% created 3/18/24 SN. Edited 3/18 CC

function img_path = ui_image_input()
% is there a way to have a variable input here? e.g. filename? might make
% it easier to be dependent on smth, but I may be misunderstanding the
% funciton

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
   

%=== ALLOW FOR IMAGE UPLOAD (link, copy/paste, multiple options????)
% set og_img equal to ui_image_input (if choosing to use it)
img_path = ui_image_input();

%ADD case for user-cancelling input

%%% Load user-selected image
% og_img = imread(img_path);


%%%ADD IF STATEMENT (here or in encrypted_img?) <-- almost def in encrypted
%%%img. Only call this function if the user actually inputs a file path

% goal: 1) if user chooses to upload an image, use this function [upload & use
% as og_img. 2) if user chooses to create own matrix directly, use that. 3)
% if user chooses to upload a link, use that
%%% for all of these inputs, if it exceeds a certain size [may need to test
%%% possible sizes] will be returned [saying og_img must be < __ x __
%%% pixels]

end
