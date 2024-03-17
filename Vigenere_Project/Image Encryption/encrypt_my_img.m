function encrypted_img = encrypt_my_img(og_img, key)
%%% LAST EDITED 03/17/24 SP [output of all 4 images-- can't tell if it is
%%% doing what we want it to, though. But spiral is generated, XOR img is
%%% too.

%=== ALLOW FOR IMAGE UPLOAD (link, copy/paste, multiple options????)
%image_file = uigetfile SP, working to allow user to upload,,, uigetfile
%command matlab, looking into it more

%=== ENCRYPT THE XOR TO GET FINAL ENCRYPTED IMG
% xor_img + key_new2 = encrypted_img 

%%% NEED TO CALL KEY TO IMG 1
key_new1 = key_to_img1(og_img, key);

%%%NEED TO CALL CREATE XOR
xor_img = create_xor(og_img, key_new1);

% Make key matrix (Call key_to_img2)
key_new2 = key_to_img2(og_img, key);

% Right image and right key? Check
if ~isequal(size(og_img), size(key_new2))
    disp('size issue'); %%REMOVE LATER, for debugging reasons
end


% Create encrypted image
encrypted_img = double(xor_img) + double(key_new2);
encrypted_img = mod(encrypted_img, 256); %wraparound if eneded

% Display original and encrypted images
figure;
subplot(1, 4, 1);
imshow(og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Original Image');
axis off;

subplot(1, 4, 2);
imshow(xor_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('XOR Image');
axis off;

subplot(1, 4, 3);
imshow(key_new2, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Spiral Cipher');
axis off;

subplot(1, 4, 4);
imshow(encrypted_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Encrypted Image');
axis off;


end