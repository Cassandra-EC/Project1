% created 3/22 CC

function key_new3 = key_to_img3(og_img, key)
%%% FIX THIS PART
%%%% CC:ERROR ADD SUMMARY ADD INPUTS ADD OUTPUTS

%%% KEY_TO_IMG3 'encrypts' a submitted image according to a submitted key
% word/words in ASCII format. 
% The key is converted into two matrices the same size as og_img (i.e. also
% images!) that are used to manipulate the original image into an encrypted
% version. The formula is as follows: og_img + (key_new1*key_new2) =
% encrypted_img

%%% SUMMARY: encrypt a submitted image using a 'key' input (ASCII characters
% accepted). Can also decrypt using the decrypt_my_img function

    %%% INPUTS:
        % og_img = an original input image
        % key = text (ASCII characters) used to encrypt the og_img
    
    %%% OUTPUTS: 
        % encrypted_img = a new image made using both og_img and the key


%%% USE SIMPLE_KEY_IMG TO CREATE XOR
% add key_new1 values to og_img (may produce value >255)
key_new1 = key_to_img1(og_img, key);
key_new2 = key_to_img2(og_img, key);

key_new3 = (88 + double(key_new1)) .* double(key_new2)); 
% [adding 88 is just an homage to one of our star coders. can be
% removed/changed]
key_new3 = mod(key_new3, 256);      % wrap around values >255
key_new3 = uint8(key_new3);  


% USE FOR DEBUGGING
% imshow(key_new3, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
% title('KEY3');
% axis off;


end


