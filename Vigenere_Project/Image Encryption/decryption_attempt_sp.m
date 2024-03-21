%%%%%%%% messing around with a new script....
function decrypt_img = decryption_attempt_sp(encrypted_img, key)

% Get size of encrypted image
[rows, cols, ~] = size(encrypted_img);
disp('Size of encrypted_img:');
    disp(size(encrypted_img));
    disp('Data type of encrypted_img:');
    disp(class(encrypted_img));


% generate Key Image 1 (key_new1)
key_new1 = key_to_img1(encrypted_img, key);

% generate Key Image 2 (key_new2)
key_new2 = key_to_img2([rows, cols], key);

%key_new2 = uint8(key_new2);

% handle division by 0 cases
%zero_replacement = 1;

key_new2_nozeros = key_new2;
key_new2_nozeros(key_new2_nozeros == 0) = 1; %reassign zeros to 1?

%zeros_indices = key_new2_nozeros == 0; % indices where key_new2 = 0
%key_new2_nozeros(zeros_indices) = zero_replacement; %replace zeros with small number

% Debug
% disp(size(zeros_indices)); % Should be the same as size(encrypted_img)
% disp(size(key_new2_nozeros)); % Should be the same as size(encrypted_img)

% Decrypt XOR Image (division between encrypted and key_new2)
%%% may be getting error due to division by 0-- there are 0's in my test
%%% key_new
decrypt_xor_img = double(encrypted_img) ./ double(key_new2_nozeros);

% Subtract key_new1 from XOR to get original image
decrypt_img = decrypt_xor_img - key_new1;

% Range for decrypt
decrypt_img = mod(decrypt_img, 256);

decrypt_img = uint8(decrypt_img);

figure(1)
imshow(decrypt_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('OG Image (return from encrypted)');
axis off;


end
