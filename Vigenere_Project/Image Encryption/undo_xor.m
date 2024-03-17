function og_img = undo_xor(encrypted_img, key)
%%% Returns original image from the encrypted image and key

% Make key into matrix again
key_new2 = key_to_img2(encrypted_img, key);


% Decrypt and provide og_img again
og_img = encrypted_img - uint8(key_new2);
og_img = mod(og_img, 256); % Wraparound if needed

imshow(og_img);
title('Decrypted Image');
axis off;

end