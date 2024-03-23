% created 3/18 CC
% Edited 03/20 SP-- functional and returns encrypted image upon completion
% of dialogue boxes, etc
% edited 3/22 SP

% === INSTRUCTIONS TO USER FOR HOW TO USE FUNCTION
function img_input = dialog_input()

    %=== ASK USER FOR IMAGE SUBMISSION; 3 OPTIONS (file, url, code own matrix)

    while true
        options = {'Upload image from file', 'Provide image URL', 'Create image array'};
        
        try
            % 3 upload options, if user hits return, defaults to upload from file
            image_preference = questdlg('How would you like to upload your image?', 'Image Upload', options{1}, options{2}, options{3}, options{1});

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


            % if user selects array upload option
            elseif strcmp(image_preference, options{3})
                disp("A fellow coder! You've chosen to create an array to use as your image.");
                disp("Please create your image array and title it 'img'.");

                %msgbox("Create your image array. Click OK when= you're done!", 'Image Array Creation');

                % Wait for user to click
                uiwait(msgbox("Create your image 'img'. Click OK when done!", 'Create img'));

                % If img not set to og_img, error message
                if exist('img', 'var') == 0
                    print('img');
                    error("NO IMAGE ARRAY SUBMITTED. PLEASE MAKE SURE TO ASSIGN YOUR IMAGE YOUR IMAGE TO THE VARIABLE NAME 'img'");
                end

            % ERROR IF USER TAKES ANOTHER ACTION (somehow)
            else
                error('Invalid option selected.');
            end
<<<<<<< HEAD
=======
            
            % Size check loop
            while true
                [img_size, size_lim] = size_check(img, image_preference, img_path);
    
                %%% SIZE CHECK, once img loaded
                if img_size > size_lim
                    disp('Image size exceeds the maximum allowed size.');
                    disp('Please select a different image.');
                    % Reupload image
                    break;
                else
                    % if selected image is right size, break loop
                    break;
                end
            end

            if img_size <= size_lim
                % Exit upload loop
                break;
            end

>>>>>>> 695f0408ecf0f3e7d845b3006b5e56a5d020f2ac
        catch
            disp('An error occurred! Please try again.');
        end
    end
    

% show image
figure(1);
imshow(img, 'InitialMagnification', 'fit');
title('IMAGE SELECTED');
axis off;
           
while true
    confirm_use = questdlg('Is this the image you would like to use?', 'Confirm Image', 'Use this!', 'Cancel', 'Use this!');
 
     % Check user's response
     if strcmp(confirm_use, 'Use this!')
         % Close image
         close(1);

         while true
            % Ask user for key input
            key_cell = inputdlg('Enter key! Be creative! The longer and cooler your key, the stronger the encryption B)', 'Key Input', [1, 50]);
 
 
             % Check for key
             if isempty(key_cell)
                 error('No key provided.');
             else 
                 % Extract key (key cannot be used when cell array)
                 key = key_cell{1};
                 % Save key as variable in Workspace
                 assignin('base', 'key', key);
                 break; % Exit key input loop
             end
         end
         break; % Exit image confirmation loop
 
    elseif strcmp(confirm_use, 'Cancel')
         disp('Image canceled.');
         img = [];
         % Restart image dialog
         img = dialog_input();
         if isempty(img)
             break; % Exit loop if user cancels
         end

     else 
         disp('Unexpected error. Image canceled.');
         img = [];
         % Restart image dialog
         img = dialog_input();
         if isempty(img)
             break; % Exit loop if user cancels
         end
     end
 
end

img_input = img;

end
