%%%%%%%% messing around with a new script....
function return_og_img = decryption_attempt_sp(encrypted_img, key)

% Remake key_new1
key_new1 = uint8(key_to_img1(encrypted_img, key));
% Remake key_new2
key_new2 = uint8(key_to_img2(encrypted_img, key));

% No division by 0 (testing again)
zero_replacement = 10^(-4);
key_new2_nonzero = key_new2;
key_new2_nonzero(key_new2 == 0) = zero_replacement;


% Divide encrypted image by key_new2 to recover xor image
xor_img2 = double(encrypted_img) ./ double(key_new2_nonzero);

% keep in range (test) [0, 255]
xor_img2 = mod(xor_img2, 256);
%xor_img2 = max(0, min(xor_img2, 255));

% Scale key_new2 (testing)
key_new1_scaled = (double(key_new1) / 255) * max(xor_img2(:));

% Recover original image (subtract key_new1_scaled from xor_img2)
return_og_img = xor_img2 - double(key_new1_scaled);

% No negative values
return_og_img = max(return_og_img, 0);

% Wraparound, if needed
return_og_img = mod(return_og_img, 256);


figure;
subplot(1, 4, 1);
imshow(encrypted_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('encrypted Image');
axis off;

%%% SHOW XOR IMAGE
subplot(1, 4, 2);
imshow(xor_img2, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('XOR Image2');
axis off;

%%% SHOW SPIRAL KEY
subplot(1, 4, 3);
imshow(key_new2_nonzero, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('key 2');
axis off;

%%% SHOW FINAL IMAGE
subplot(1, 4, 4);
imshow(return_og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('og...');
axis off;

end
