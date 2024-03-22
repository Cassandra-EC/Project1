% created 3/15/24 CC. 
% Edited 3/17/24 SN [output of all 4 images-- can't tell if it is
%%% doing what we want it to, though. But spiral is generated, XOR img is
%%% too.
% edited 3/18/24 CC SP
% edited 3/22 CC [NEW BRANCH CREATED, NEW IDEA]

function encrypted_img = encrypt_my_img(og_img, key)
%%% ENCRYPT_MY_IMG 'encrypts' a submitted image according to a submitted key
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


%=== KEY PREPARATION ===%
%%% CALL KEY_NEW1: img from 'key' numeric values repeating through rows
key_new1 = key_to_img1(og_img, key);


%%% CALL KEY_NEW2: img from 'key' numeric values spiraled from center
key_new2 = key_to_img2(og_img, key);


%%% CALL KEY_NEW3: img from key_new1 x key_new2 (element-wise)
key_new3 = key_to_img3(og_img, key);
%key_new3 made to fit 0-256. not a necessity! just for display if desired
mod(key_new3, 256);         


%%% ENCRYPT IMAGE: new img from og_img + key_new3
encrypted_img = double(og_img) + double(key_new3);
encrypted_img = mod(encrypted_img, 256);

% flip image 180 (for fun)
encrypted_img = imrotate(encrypted_img, 180);




%=== DISPLAY ORIGINAL & ENCRYPTED IMAGES ===%
%CC:ERROR I think goal should be (if possible) to open 2 windows: 
% window1: shows  user every stage of their img (og, key1, key2, key3, and
% encrypted). This should have VERY CLEAR LABELS, including window titled
% 'for your benefit' or smth.

% window2: shows encrypted_img ALONE. NO TITLE. NOTHING ELSE. This is so
% that they can download & send to friend. One HAS to be able to download &
% upload this img. And then decrypt it and have og_img return. Good to test
% decryption with the stored variable, but REAL USERS wouldn't have
% encrypted_img stored!! Computer needs to be able to handle it. 
    % The window can be titled 'download and send your encrypted img' or smth
% like that. But in the BAR, not as a 'title' within the window. In a spot
% where it won't be seen upon decryption


% Restore all images to uint8
% CC:ERROR  Try with/without this part. May not be necessary but keeping it
% for now.
og_img = uint8(og_img);
key_new1 = uint8(key_new1);
key_new2 = uint8(key_new2);
key_new3 = uint8(key_new3);
encrypted_img = uint8(encrypted_img);



% first figure: all the info
% CC:ERROR [already put but repeating here]: we need another figure w only
% the encrypted_img
figure;

%%% SHOW ORIGINAL IMAGE

subplot(3, 3, 2);   % middle spot of 1st row (3x3 grid)
imshow(og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('ORIGINAL:');
axis off;


%%% SHOW KEY1 clc(straight across)
subplot(3, 3, 4);
imshow(key_new1, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('KEY1');
axis off;

%%% SHOW KEY2 (spiral)
subplot(3, 3, 5);
imshow(key_new2, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('KEY2');
axis off;

%%% SHOW KEY3 (key_new1 .* key_new2)
subplot(3, 3, 6);
imshow(key_new3, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('KEY3');
axis off;

%%% SHOW ENCRYPTED, FINAL IMG
subplot(3, 3, 8);     % middle spot of last row (3x3 grid)
imshow(encrypted_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('ENCRYPTED');
axis off;

% ADD ANOTHER FIGURE HERE !!!!


end