% created 3/18 CC
% Edited 03/20 SP-- functional and returns encrypted image upon completion
% of dialogue boxes, etc
% debugging 3/22 CC. Renamed to 'e_dlg' for now. ERRORS/Qs BEGIN W '%CC:ERROR'

%answer = inputdlg(prompt,dlgtitle,fieldsize,definput,opts)specifies that the 
% dialog box is resizeable in the horizontal direction when opts is set to 
% 'on'. When opts is a structure, it specifies whether the dialog box is 
% resizeable in the horizontal direction, whether it is modal, and whether 
% the prompt text is interpreted.



% === INSTRUCTIONS TO USER FOR HOW TO USE FUNCTION
function encrypted_img = dialog_input()
    %%% consi

    %=== ASK USER FOR IMAGE SUBMISSION; 3 OPTIONS (file, url, code own matrix)

    while true      % option window appears & remains until one is chosen
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

                    %CC:ERROR    
                    % does this show the img? Guessing we want to save for later, 
                    % since that happens in the image confirmation portion
                    imshow(img);
                    title('Downloaded Image');
                    axis off;
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

                    %CC:ERROR 
                    %%% ADD LOOP/SEND BACK TO SUBMISSION POSSIBILITY!! %%%

                end

            % ERROR IF USER TAKES ANOTHER ACTION (somehow)
            else
                error('Invalid option selected.');
            end

        catch
            disp('An error occurred! Please try again.');
        end
    end
    
%%% %CC:ERROR - GUESSING THIS IS NOT NEEDED NOW? WANT TO CONFIRM
    % if isempty(image_preference)
    %     error('Please enter a preference for your image upload (either 1, 2, or 3)');
    % end

    
            %CC:ERROR 
            % %%LOOP BACK SOMEWHERE FROM HERE!! RESTART WHOLE FUNCTION, SOME DIALOGUE?

     
    




% CC:ERROR   IMAGE SHOULD GO AWAY AFTER BEING CONFIRMED! 
% As well as after being rejected. otherwise clogs up w repetition & gets
% confusing once encryption appears. Should be quick



% confirm & let user cancel if not the desired result
%=== DISPLAY USER'S IMAGE FOR CONFIRMATION

% show image
figure(1);
imshow(img, 'InitialMagnification', 'fit');
title('IMAGE SELECTED');
axis off;
           
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
         % Save key as variable in Workspace
         assignin('base', 'key', key);
 
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
end
