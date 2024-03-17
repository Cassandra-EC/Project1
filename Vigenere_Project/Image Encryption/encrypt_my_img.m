function encrypted_img = encrypt_my_img(og_img, key)


%=== ALLOW FOR IMAGE UPLOAD (link, copy/paste, multiple options????)


%=== ENCRYPT THE XOR TO GET FINAL ENCRYPTED IMG
% xor_img + key_new2 = encrypted_img

% Create encrypted image
encrypted_img = xor_img + uint8(key_new2);
encrypted_img = mod(encrypted_img, 256); %wraparound if eneded

% Display original and encrypted images
figure;
subplot(1, 3, 1);
imshow(og_img);
title('Original Image');
axis off;

subplot(1, 3, 2);
imshow(xor_img);
title('XOR Image');
axis off;

subplot(1, 3, 3);
imshow(encrypted_img);
title('Encrypted Image');
axis off;

end