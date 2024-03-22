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
function encrypted_img = e_dlg()
    %%% consi

%=== ASK USER FOR IMAGE SUBMISSION; 3 OPTIONS (file, url, code own matrix)


while true      % option window appears & remains until one is chosen
    options = {'Upload image from file', 'Provide image URL', 'Create image array'};

    % 3 upload options, if user hits return, defaults to upload from file
    image_preference = questdlg('How would you like to upload your image?', 'Image Upload', options{1}, options{2}, options{3}, options{1});
    

    %%% %CC:ERROR - GUESSING THIS IS NOT NEEDED NOW? WANT TO CONFIRM
    % if isempty(image_preference)
    %     error('Please enter a preference for your image upload (either 1, 2, or 3)');
    % end

    %=== FILE UPLOAD DIALOGUE 
    if strcmp(image_preference, options{1})
        disp("Excellent. You've chosen to upload an image file from your device.")
        
        % Selected file saved with path & name
        [file_name, file_path] = uigetfile({'*.jpg; *.jpeg; *.png', 'Image Files'}, 'Select Image File');
        
        % ERROR if 'cancel' hit (no image selected)
        if isequal(file_name, 0) || isequal(file_path, 0)
            error('No image file selected.');

            %CC:ERROR 
            % %%LOOP BACK SOMEWHERE FROM HERE!! RESTART WHOLE FUNCTION, SOME DIALOGUE?

        end
        
        % Load/read image to prepare for next steps. Then break
        img_path = fullfile(file_path, file_name);
        og_img = imread(img_path);
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
            og_img = webread(img_url);
            
            %CC:ERROR    
            % does this show the img? Guessing we want to save for later, 
            % since that happens in the image confirmation portion
            imshow(og_img);
            title('Downloaded Image');
            axis off;
            break; % Exit loop
        catch
            error('Failed to read your image from provided URL.');
        end
    
    % if user selects array upload option
    elseif strcmp(image_preference, options{3})
         disp("A fellow coder! You've chosen to create an array to use as your image.");
         disp("Please create your image array and title it 'og_img'.");
    
         %msgbox("Create your image array. Click OK when= you're done!", 'Image Array Creation');
        
         % Wait for user to click
         uiwait(msgbox("Create your image 'og_img'. Click OK when done!", 'Create og_img'));
        
         % If img not set to og_img, error message
         if exist('og_img', 'var') == 0
             print('og_img');
             error("NO IMAGE ARRAY SUBMITTED. PLEASE MAKE SURE TO ASSIGN YOUR IMAGE YOUR IMAGE TO THE VARIABLE NAME 'og_img'");
            
             %CC:ERROR 
             %%% ADD LOOP/SEND BACK TO SUBMISSION POSSIBILITY!! %%%

         end
         break; % Exit loop
    
    % ERROR IF USER TAKES ANOTHER ACTION (somehow)
    else
        error('Invalid option selected.');
    end

end

 %CC:ERROR    EACH IMAGE NEEDS TO BE CHECKED FOR MAX SIZE. IF IT'S TOO BIG
 %THEY NEED TO RESELECT. Again would need to loop to the start. My thought
 %rn is:
 % 1) errors within loop (e.g. cancel, empty matrix, etc., improper
 %url) should take user back to retrying whichever option they had
 %initially chosen. e.g. back to file upload or url upload. (Restart from
 %reselecting image)

 % 2) errors pertaining to size should take the user back to choosing which
 % type of input they want. 3 options again (restart from beginning/reselecting 
 % image type, minus instructions). rn if size is too big there is no clear
 % error, & it's smth the user is v likely to mess up. They need to do smth
 % <8gb. Maybe we should also figure out # pixels sq that might compare to
 
 % 2.5) I'm actually  a bit concerned bc I uploaded a file that was < 8 gb,
 % yet got told it was 15 gb? Square img and told array was 664x1153200x3
 % [massive number tf]. I'm pretty sure this is an image I had uploaded
 % before and had work, and now it's not functioning.

 % 3) After being shown image for confirmation: if user says they don't
 % like it, should also restart from beginning minus instructions.
 % Currently does nothing.


 % I think that's it ?


 % additional changes:
 % 1) as soon as someone starts the app? or matlab? We should have an
 % instruction page (prob a diff function that somehow starts upon
 % starting? I am sure this is possible). This should explain encryption vs
 % decryption and let the user choose which one. If they choose encryption,
 % they get this function to start





%=== DISPLAY USER'S IMAGE FOR CONFIRMATION
% show image
imshow(og_img, 'InitialMagnification', 'fit');
title('IMAGE SELECTED');
axis off;

% CC:ERROR   IMAGE SHOULD GO AWAY AFTER BEING CONFIRMED! 
% As well as after being rejected. otherwise clogs up w repetition & gets
% confusing once encryption appears. Should be quick



% confirm & let user cancel if not the desired result
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
