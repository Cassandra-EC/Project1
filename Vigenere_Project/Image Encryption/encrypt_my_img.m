function encrypted_img = encrypt_my_img(og_img, key)
%%% LAST EDITED 03/17/24 SP [output of all 4 images-- can't tell if it is
%%% doing what we want it to, though. But spiral is generated, XOR img is
%%% too.

% ensure og_img is uint8
og_img = uint8(og_img);

%=== ENCRYPT THE XOR TO GET FINAL ENCRYPTED IMG
% xor_img + key_new2 = encrypted_img 

%%% NEED TO CALL KEY TO IMG 1
key_new1 = uint8(key_to_img1(og_img, key));

%%%NEED TO CALL CREATE XOR
xor_img = uint8(create_xor(og_img, key_new1));

% Make key matrix (Call key_to_img2)
key_new2 = uint8(key_to_img2(og_img, key));


% [debug] Confirm that og_img and key_new2 are the same size
if ~isequal(size(og_img), size(key_new2))
    disp('size issue'); %%REMOVE LATER, for debugging reasons
    size(og_img)
    size(key_new2)
end


% Create encrypted image
encrypted_img = double(xor_img) + double(key_new2);
encrypted_img = mod(encrypted_img, 256); %wraparound if needed
encrypted_img = uint8(encrypted_img);

% Display original and encrypted images
figure;
subplot(1, 4, 1);
imshow(og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Original Image');
axis off;

subplot(1, 4, 2);
imshow(xor_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('XOR Image (original + key)');
axis off;

subplot(1, 4, 3);
imshow(key_new2, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Key 2 (spiral)');
axis off;

subplot(1, 4, 4);
imshow(encrypted_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Encrypted Image');
axis off;


end