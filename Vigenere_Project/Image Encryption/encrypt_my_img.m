% created 3/15/24 CC. 
% Edited 3/17/24 SN [output of all 4 images-- can't tell if it is
%%% doing what we want it to, though. But spiral is generated, XOR img is
%%% too.
% edited 3/18/24 CC


function encrypted_img = encrypt_my_img(my_img, key)
%%% LAST EDITED 03/17/24 SP 

%=== CALL OG_IMG BASED ON USER'S METHOD


% rn if nothing is assigned to my_img (e.g. no matrix), will ask for file 
if isempty(my_img)
   % if using ui_image_input
img_path = ui_image_input();
    og_img = img_path;
else
    og_img = my_img;
end

% elseif using url
% elseif using matrix they made


% %=== confirm class of variables
% % ensure og_img is uint8
% og_img = uint8(og_img);
% class(og_img);
% class(key_new1);
% class(xor_img);
% class(key_new2);

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


%=== DISPLAY ORIGINAL & ENCRYPTED IMAGES
% Restore all images to uint8
og_img = uint8(og_img);
xor_img = uint8(xor_img);
key_new2 = uint8(key_new2);
encrypted_img = uint8(encrypted_img);

%%% SHOW ORIGINAL IMAGE
figure;
subplot(1, 4, 1);
imshow(og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Original Image');
axis off;


%%% SHOW XOR IMAGE
subplot(1, 4, 2);
imshow(xor_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('XOR Image (Original + Key)');
axis off;

%%% SHOW SPIRAL KEY
subplot(1, 4, 3);
imshow(key_new2, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Key 2 (spiral)');
axis off;

%%% SHOW FINAL IMAGE
subplot(1, 4, 4);
imshow(encrypted_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Encrypted Image');
axis off;


end