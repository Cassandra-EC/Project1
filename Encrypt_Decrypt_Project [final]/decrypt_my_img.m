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



%=== 'UNSCRAMBLE' encrypted_img (created separate quadrants before & rotated 180)
% 'unrotate': rotate 180
encrypted_img = imrotate(encrypted_img, 180);

% 'untile': shift each half of image, for more pronounced encryption [creates
% quadrants]
half_w = floor(width(encrypted_img)/2);
half_h = floor(height(encrypted_img)/2);
encrypted_img = circshift(encrypted_img, [-half_w, -half_h]); 


%=== LOAD KEY3, using encrypted_img as size reference
key_new3 = key_to_img3(encrypted_img, key);


%=== RETURN OG_IMG
return_og_img = double(encrypted_img) - double(key_new3);
return_og_img = mod(return_og_img, 256); % Wraparound if needed
return_og_img = uint8(return_og_img);


figure;
% show (decrypted) og_img 
imshow(return_og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Decrypted Image! [pls know that this is subject to..noise :(');
axis off;

end

