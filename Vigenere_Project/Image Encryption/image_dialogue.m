% created 3/18 CC


function og_img = image_dialogue()




%%% DEALING WITH DIALOGUE BOXES & INPUTs
% image input [call this in another function most likely]: let the user
% choose to input a 1) file, 2) url, or 3) create their own matrix for
% encryption. Includes informative & 'lively' prompts from the site


%answer = inputdlg(prompt,dlgtitle,fieldsize,definput,opts)specifies that the 
% dialog box is resizeable in the horizontal direction when opts is set to 
% 'on'. When opts is a structure, it specifies whether the dialog box is 
% resizeable in the horizontal direction, whether it is modal, and whether 
% the prompt text is interpreted.

% prompt = {'URL for desired image', 'Desired key (non-alphabetical symbols accepted!'};
% title = input;
% 
% og_img?? = inputdlg(prompt, title, fieldsize, opts.Resize = 'on', opts.WindowStyle = 'normal');
% 


%Call this at start of encrypt_my_img

% === INSTRUCTIONS TO USER FOR HOW TO USE FUNCTION


% === BOX TO ENTER KEY


% === INSTRUCTIONS FOR IMAGE REQUIREMENTS


% === DIALOGUE TREE: 3 OPTIONS FOR IMAGE UPLOAD

options = {'Upload image from file', 'Provide image URL', 'Create image array'};
% gives 3 options, if user hits return, defaults to upload from file
image_preference = questdlg('How would you like to upload your image?', 'Image Upload', options{1}, options{2}, options{3}, options{1});

if isempty(image_preference)
    error('Please enter a preference for your image upload (either 1, 2, or 3)');
end

% if user selects upload image from file
if strcmp(image_preference, options{1})
    disp("Excellent. You've chosen to upload an image file from your device.")
    [file_name, file_path] = uigetfile({'*.jpg, *.jpeg, *.png', 'Image Files'}, 'Select Image File');
    % case for user cancelling input
    if isequal(file_name, 0) || isequal(file_path, 0)
        error('No image file selected.');
    end
    
    % load and read image for encryption
    img_path = fullfile(file_path, file_name);
    og_img = imread(img_path);

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
    catch
        error('Failed to read your image from provided URL.');
    end

%%% array upload option

else
    error('Invalid option selected.');
end
    
% Display image for confirmation
imshow(og_img);
title('Your Image');
axis off;

confirm_img = questdlg('Is this the image you would like to encrypt?', 'Confirm Image', 'Yes', 'No', 'Yes');
if isempty(confirm_img) || strcmp(confirm_img, 'No')
    error('Image selection canceled.');
end

%=== CHECK IF IMG IS VIABLE; OTHERWISE MAKE TRY AGAIN





    %=== CHECK IF USER WANTS THIS IMG; OTHERWISE MAKE TRY AGAIN
    disp(og_img);
    confirm_img_prompt = "Is this the image you would like to use? Y/N: ";
    confirm_img = input(confirm_img_prompt, "s");
    
    if contains(confirm_img, 'y', IgnoreCase=true)==Y
        disp("Sounds good. Now let's encrypt your image.");
        % encrypt_my_img called here??
    else
        %=== send back to either 1) file selection or 2) back to start?


    end


elseif contains(image_preference, '2')==1 && contains(image_preference, '1')==0 && contains(image_preference, '3')==0 
    disp("Very nice. You've chosen to provide a url to your desired img.")
    %=== INSERT DIALOG BOX FOR URL
    
    % og_img = ????


    %=== CHECK IF IMG IS VIABLE; OTHERWISE MAKE TRY AGAIN
    % 1) CONFIRM RIGHT TYPE OF FILE

    % 2) CONFIRM OKAY SIZE



    %=== CHECK IF USER WANTS THIS IMG; OTHERWISE MAKE TRY AGAIN
    disp(og_img);
    confirm_img_prompt = "Is this the image you would like to use? Y/N: ";
    confirm_img = input(confirm_img_prompt, "s");
    
    if contains(confirm_img, 'y', IgnoreCase=true)==Y
        disp("Sounds good. Now let's encrypt your image.");
        % encrypt_my_img called here??
    else
        %=== send back to either 1) file selection or 2) back to start?


    end


elseif contains(image_preference, '3') == true
    disp("A fellow coder, how nice! You've chosen to create an array to use as your image.")
    disp("We'll give you all the time you need to create your image. " + ...
        "Set your matrix equal to 'og_img', and once done, just type 'DONE' in the command window!")

    disp("");
    disp("OG_IMG CREATION WINDOW");



    %=== ALLOW TO CODE AND CREATE DESIRED OG_IMG


    %=== ONCE 'DONE' IS TYPED, MOVE ON

   
    %=== CHECK IF IMG IS VIABLE; OTHERWISE MAKE TRY AGAIN
    % 1) CONFIRM THAT IT'S NOT EMPTY

    % 2) CONFIRM THAT IT'S THE RIGHT TYPE OF INPUT (I GUESS DOUBLE & UINT8)

    % 3) CONFIRM OKAY SIZE


    %=== CHECK IF USER WANTS THIS IMG; OTHERWISE MAKE TRY AGAIN
    disp(og_img);
    confirm_img_prompt = "Is this the image you would like to use? Y/N: ";
    confirm_img = input(confirm_img_prompt, "s");
    

    if contains(confirm_img, 'y', IgnoreCase=true)==Y
        disp("Sounds good. Now let's encrypt your image.");
        % encrypt_my_img called here??

    else
        %=== send back to either 1) img creation or 2) back to start?


    end



else 
end






% choices:
% 1) mandatory: keys
% - checks that key is valid (if not try again)
% 
% 
% 2) checkboxes? DECISION TREE [potentially disp, await response, pick 1/2/3]
% if size is too big, make user try again
% - A) upload file from computer
        % SN's function
% - B) input URL
        % diff function, give url it does webread/imread
% - C) create your own matrix
        % type in DONE when complete? 
% --> next
% 
% 
% 3) next --> confirm both inputs look good (otherwise return to user)
% 


