% created 3/15/24 CC. Edited 3/17/24 SN
% edited 3/18/24 CC. Renamed from 'undo_xor' to 'return_xor' [now actually
% true to purpose]

function return_og_img = decrypt_my_img(encrypted_img, key)
%%% Returns original image from return_xor_image and key. Final step in
%%% decryption


%=== LOAD XOR_IMG & KEY_NEW1
% both use encrypted_img as a size reference rather than og_img. Key is
% dependent on the size of image, rather than content

% xor
return_xor_img = return_xor(encrypted_img, key);

%%% key_new1
key_new1 = key_to_img1(encrypted_img, key);




%=== RETURN OG_IMG FROM XOR_IMG (in turn from encrypted img)

%%% xor_img - key_new1 = og_img 
return_og_img = (return_xor_img) - (key_new1);
return_og_img = mod(return_og_img, 256); % Wraparound if needed

imshow(return_og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('OG Image (return from encrypted)');
axis off;

end