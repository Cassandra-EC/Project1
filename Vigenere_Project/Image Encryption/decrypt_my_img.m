% created 3/15/24 CC. Edited 3/17/24 SN. Edited 3/18 CC
% edited 3/22 CC. 

function return_og_img = decrypt_my_img(encrypted_img, key)
%%% Returns original image from return_xor_image and key. Final step in
%%% decryption
%%%% CC:ERROR ADD SUMMARY ADD INPUTS ADD OUTPUTS

%%% DECRYPT_MY_IMG 'decrypts' a submitted image according to a submitted key
% word/words in ASCII format. Attempts to restore the og_img initially
% used. CAUTION!!! decryption is imperfect and exists to provide a better
% sense of the original. Do not expect an exact replica!
%%% SUMMARY: encrypt a submitted image using a 'key' input (ASCII characters
% accepted). Can also decrypt using the decrypt_my_img function

    %%% INPUTS:
        % og_img = an original input image
        % key = text (ASCII characters) used to encrypt the og_img
    
    %%% OUTPUTS: 
        % encrypted_img = a new image made using both og_img and the key



%=== 'UNROTATE' encrypted_img (was rotated 180 before)
encrypted_img = imrotate(encrypted_img, 180);

%=== LOAD KEY3, using encrypted_img as size reference
key_new3 = key_to_img3(encrypted_img, key);


%=== RETURN OG_IMG
return_og_img = encrypted_img - key_new3;
return_og_img = mod(return_og_img, 256); % Wraparound if needed
%return_og_img = uint8(return_og_img);


figure;
%%% FOR DEBUGGING USE ONLY
subplot(1,3,2);
imshow(encrypted_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('encrypted img)');
axis off;

% show (decrypted) og_img 
subplot(1,3,2);
imshow(return_og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('OG Image (returned from encrypted img)');
axis off;

%%% FOR DEBUGGING USE TEST_IMG and show original
subplot(1,3,3);
test_img = test();
imshow(test_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('actual og (test!!)');
axis off;

end

