% created 3/18 CC
% Edited 03/20 SP-- functional and returns encrypted image upon completion
% of dialogue boxes, etc

%answer = inputdlg(prompt,dlgtitle,fieldsize,definput,opts)specifies that the 
% dialog box is resizeable in the horizontal direction when opts is set to 
% 'on'. When opts is a structure, it specifies whether the dialog box is 
% resizeable in the horizontal direction, whether it is modal, and whether 
% the prompt text is interpreted.


% === INSTRUCTIONS TO USER FOR HOW TO USE FUNCTION
function encrypted_img = image_dialogue()

% Loop until selection or cancel
while true
    options = {'Upload image from file', 'Provide image URL', 'Create image array'};
    % gives 3 options, if user hits return, defaults to upload from file
    image_preference = questdlg('How would you like to upload your image?', 'Image Upload', options{1}, options{2}, options{3}, options{1});

    if isempty(image_preference)
        error('Please enter a preference for your image upload (either 1, 2, or 3)');
    end

    % if user selects upload image from file
    if strcmp(image_preference, options{1})
        disp("Excellent. You've chosen to upload an image file from your device.")
        [file_name, file_path] = uigetfile({'*.jpg; *.jpeg; *.png', 'Image Files'}, 'Select Image File');
        % case for user cancelling input
        if isequal(file_name, 0) || isequal(file_path, 0)
            error('No image file selected.');
        end
    
        % load and read image for encryption
        img_path = fullfile(file_path, file_name);
        og_img = imread(img_path);
        break; % Exit loop
    
    % if user selects provide image URL
    elseif strcmp(image_preference, options{2})
        img_url = inputdlg('Enter the URL of your image:', 'Image URL', [1, 100]);
        % case for no URL provided
        if isempty(img_url)
            error('No image URL entered.');
        end
    
        % Extract the URL (in position {1} of img_url)
        img_url = img_url{1};
    
        try
            % Attempt to read image from URL
            og_img = webread(img_url);
    
            imshow(og_img);
            title('Downloaded Image');
            axis off;
            break; % Exit loop
        catch
            error('Failed to read your image from provided URL.');
        end
    
    % if user selects array upload option
    elseif strcmp(image_preference, options{3})
         disp("A fellow coder, how nice! You've chosen to create an array to use as your image.");
         disp("Please create your image array in the variable 'og_img'.");
    
         msgbox("Create your image array. Click OK when you're done!", 'Image Array Creation');
        
         % Wait for user to click
         uiwait(msgbox("Create your image array. Click OK when you're done!", 'Image Array Creation'));
    
         if ~exist('og_img', 'var')
             error('No image array created. Please make sure to define the variable ''og_img'' as your image!');
         end
         break; % Exit loop
    
    % If somehow user does something else...
    else
        error('Invalid option selected.');
    end
end

% Display image for confirmation
imshow(og_img);
title('Your Image');
axis off;
   
% Loop for confirmation
while true
    confirm_encrypt = questdlg('Is this the image you would like to encrypt?', 'Confirm Image and Encryption', 'Encrypt', 'Cancel', 'Encrypt');

    % Check user's response
    if strcmp(confirm_encrypt, 'Encrypt')
        % Ask user for key input
        key_cell = inputdlg('Enter an encryption key:', 'Key Input', [1, 50]);
        
        % Check for key
        if isempty(key_cell)
            error('No encryption key provided.');
        end
    
        % Extract key (key cannot be used when cell array)
        key = key_cell{1};
        
        % Encrypt!
        encrypted_img = encrypt_my_img(og_img, key);
        disp('Encryption successful!');
        break; % Exit loop

    elseif strcmp(confirm_encrypt, 'Cancel')
        disp('Encryption canceled.');
        encrypted_img = [];
        break; % Exit loop
    else 
        disp('Unexpected error. Encryption canceled.');
        encrypted_img = [];
        break; % Exit loop
    end

end
