% created 3/18 CC


function og_img = image_dialogue();


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

image_prompt = "How would you like to upload your image? 1/2/3: ";
image_preference = input(image_prompt, "s");

if isempty(image_preference)
    error('Please enter a preference for your image upload (either 1, 2, or 3)');


elseif contains(image_preference, '1')==1 && contains(image_preference, '2')==0 && contains(image_preference, '3')==0 
    disp("Excellent. You've chosen to upload an image file from your device.")
    img_path = upload_file();
    og_img = imread(img_path);
    
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


