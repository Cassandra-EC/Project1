%% Created 03/21 SP, edited and finalized 03/22 SP


% === INSTRUCTIONS TO USER FOR HOW TO USE FUNCTION
function [img_input, key] = dialog_input()

%%% DIALOG INPUT runs through a dialogue tree, guiding a user through
%%% uploading an image (either as file, URL, or array). It then displays the image
% and has the user confirm for correct selection.
% Afterwards, it prompts the user to input a key. It loops and breaks,
% depending on where one is and the error-- ie, if you do not input a key
% when prompted, it then asks if you want to cancel image selection.

%%% SUMMARY: Guide's user through uploading image and key.
    
    %%% OUTPUTS: 
        % img_input = User-uploaded image, read and assigned to img_input
        % key = User input of a key, formated as a numeric array


    %=== ASK USER FOR IMAGE SUBMISSION; 3 OPTIONS (file, url, code own matrix)
    while true
        options = {'Upload image from file', 'Provide image URL', 'Create image array'};
        
        try
            % 3 upload options, if user hits return, defaults to upload from file
            image_preference = questdlg('How would you like to upload your image?', 'Image Upload', options{1}, options{2}, options{3}, options{1});
            
            % Check if user canceled the dialog
            if isempty(image_preference)
                disp('Image upload dialog canceled.');
                break;
            end

            %=== FILE UPLOAD DIALOGUE 
            if strcmp(image_preference, options{1})
                disp("Excellent. You've chosen to upload an image file from your device.")

                % Selected file saved with path & name 
                [file_name, file_path] = uigetfile({'*.jpg; *.jpeg; *.png', 'Image Files'}, 'Select Image File');

                % ERROR if 'cancel' hit (no image selected)
                if isequal(file_name, 0) || isequal(file_path, 0)
                    error('No image file selected.');
                end

                % Load/read image to prepare for next steps. Then break
                img_path = fullfile(file_path, file_name);
                img = imread(img_path);
                break; % Exit loop


            %=== URL UPLOAD DIALOGUE
            elseif strcmp(image_preference, options{2})
                img_url = inputdlg('Enter the URL of your image:', 'Image URL', [1, 100]);

                % ERROR if no URL provided
                if isempty(img_url)
                    error('No image URL entered.');
                end

                % Extract URL (stored in position {1} of img_url)
                img_url = img_url{1};

                % ATTEMPT TO READ IMG. If failed, give error
                try
                    % Attempt to read image from URL
                    img = webread(img_url);
                    break; % Exit loop
                catch
                    error('Failed to read your image from provided URL.');
                end


            % === ARRAY UPLOAD DIALOGUE
            elseif strcmp(image_preference, options{3})
                disp("A fellow coder! You've chosen to create an array to use as your image.");
                disp("Please create your image array when prompted in the dialog box.");

                img_input = inputdlg('Enter your image array!', 'Image Array Input', [10 50]);

                % Check for empty array or user cancel
                if isempty(img_input)
                    error("NO IMAGE ARRAY SUBMITTED. PLEASE MAKE SURE TO ENTER YOUR IMAGE ARRAY");
                end

                % Create image array from user input
                try
                    img_str = img_input{1};
                    img = str2num(img_str); % Turn string into numeric array
                    if isempty(img)
                        error("Invalid image array.");
                    end
                    break; % Exit loop if valid array input
                catch
                    error('Invalid image array.');
                end

            % ERROR IF USER TAKES ANOTHER ACTION (somehow)
            else
                error('Invalid option selected.');
            end
         
        %%% === Case for other unspecified errors    
        catch
            disp('An error occurred! Please try again.');
        end
    end
    
% Display image for user confirmation
figure(1);
imshow(img, 'InitialMagnification', 'fit');
title('IMAGE SELECTED');
axis off;


% === CONFIRM IMAGE and REQUEST KEY
while true
    % Confirm if user wants to use this image
    confirm_use = questdlg('Is this the image you would like to use?', 'Confirm Image', 'Use this!', 'Cancel', 'Use this!');
 
     % === CHECK USER RESPONSE
     % User choice: Use
     if strcmp(confirm_use, 'Use this!')
         % Close image
         if ishandle(1)
            close(1);
         end

         while true
            % Ask user for key input
            key_cell = inputdlg('Enter key! Be creative! The longer and cooler your key, the stronger the encryption B)', 'Key Input', [1, 50]);
 
             % Check for key
             if isempty(key_cell)
                 disp('No key provided.');
                 % If no key or dialog box canceled, check if user wishes
                 % to proceed with image selection
                 cancel_key = questdlg('Do you want to cancel the image selection?', 'Cancel Image?', 'Yes', 'No', 'Yes');
                 if strcmp(cancel_key, 'Yes')
                     img = [];
                     disp('Image canceled.');
                     return;
                 end
                 
             else 
                 % Extract key (key cannot be used when cell array)
                 key = key_cell{1};
                 % Save key as variable in Workspace
                 assignin('base', 'key', key);
                 break; % Exit key input loop
             end
         end
         break; % Exit image confirmation loop
 
    % User choice: Cancel
    elseif strcmp(confirm_use, 'Cancel')
         disp('Image canceled.');
         img = [];
         if ishandle(1)
            close(1);
         end
         % Restart image dialog
         img_input = dialog_input();
         if isempty(img)
            return;
         end

     else 
         disp('Unexpected error. Image canceled.');
         img = [];
         if ishandle(1)
            close(1);
         end
         % Restart image dialog
         img_input = dialog_input();
         if isempty(img)
             return; % Exit loop if user cancels
         end
     end
 
end

% === ASSIGN IMG TO IMG_INPUT
img_input = img;

end
