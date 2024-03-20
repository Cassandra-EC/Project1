%%%%%%%% messing around with a new script....

%%% SPIRAL KEY IS CORRECT, at least... 
function decrypt_img = decryption_attempt_sp(encrypted_img, key)

% get key_new1
key_new1 = key_to_img1(encrypted_img, key);
key_new1 = double(key_new1);

% get key_new2
key_new2 = key_to_img2(encrypted_img, key);

figure;
    imshow(key_new2, 'DisplayRange', [0, 255], 'InitialMagnification', 'fit');
    title('Key 2 (spiral)');
    axis off;

% reverse operation used to create xor_img
%encrypted_img = double(xor_img) .* double(key_new2);
return_xor_img = return_xor(encrypted_img, key);
return_xor_img = double(return_xor_img);

encrypted_img = double(encrypted_img);
decrypt_img = encrypted_img ./ double(key_new2);
decrypt_img = double(decrypt_img);

%xor_img = double(og_img) + double(key_new1); 
decrypt_img = decrypt_img - return_xor_img;
decrypt_img = mod(decrypt_img, 256);
decrypt_img = uint8(decrypt_img);

%xor_img = encrypted_img ./ double(key_new2);

%xor_img_redchannel = xor_img(:,:,1);

%figure;
%   imshow(xor_img, 'DisplayRange', [0, 255], 'InitialMagnification', 'fit');
%   title('XOR Image (Original + Key)');
%   axis off;

% get key_new1
%key_new1 = key_to_img1(xor_img_redchannel, key);

%figure;
%   imshow(key_new1, 'DisplayRange', [0, 255], 'InitialMagnification', 'fit');
%   title('Key 1 (from XOR Image)');
%   axis off;

% Get og_img (reverse operation for creating xor
%xor_img_redchannel = cast(xor_img_redchannel, class(key_new1));
%decrypt_img_redchannel = xor_img_redchannel - key_new1;

%decrypt_img_redchannel = mod(decrypt_img_redchannel, 256);

%decrypt_img_redchannel = uint8(decrypt_img_redchannel);

% Combine decrypted red channel with original blue and green channels
%decrypt_img = cat(3, decrypt_img_redchannel, encrypted_img(:,:,2:3));

figure(4)
imshow(decrypt_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('OG Image (return from encrypted)');
axis off;
end


