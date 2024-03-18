%%% DEALING WITH DIALOGUE BOXES & INPUTs

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


Call this at start of encrypt_my_img

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


    disp(og_img);
    confirm_img_prompt = "Is this the image you would like to use? Y/N: ";
    confirm_img = input(confirm_img_prompt, "s");

    if contains(confirm_img, 'y')==Y






elseif contains(image_preference, '2') == true
elseif contains(image_preference, '3') == true
else 
end



%= 1) do you want to upload a file from your computer?
if 




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


