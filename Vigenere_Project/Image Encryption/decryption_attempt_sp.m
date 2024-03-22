%%%%%%%% messing around with a new script....
function return_og_img = decryption_attempt_sp(encrypted_img, key)
%%% Returns original image from return_xor_image and key. Final step in
%%% decryption

key_new1 = uint8(key_to_img1(encrypted_img, key));
key_new2 = uint8(key_to_img2(encrypted_img, key));

xor_img2 = double(encrypted_img) ./ double(key_new2);
xor_img2 = mod(xor_img2, 256); % Wraparound values?
% keep in range (test)
xor_img2 = max(0, min(xor_img2, 255));

key_new1_scaled = (double(key_new1) / 255) * max(xor_img2(:));

return_og_img = abs(xor_img2 - double(key_new1_scaled));
return_og_img = max(return_og_img, 0);
return_og_img = mod(return_og_img, 256);


% keep in range (test)
return_og_img = max(0, min(return_og_img, 255))

% xor
% return_xor_img = return_xor(encrypted_img, key);
% 
% %%% key_new1
% key_new1 = key_to_img1(encrypted_img, key);


% %%% NEED TO CALL KEY TO IMG 1
% key_new1 = uint8(key_to_img1(og_img, key));
% 
% %%%NEED TO CALL CREATE XOR
% xor_img = uint8(create_xor(og_img, key_new1));
% 
% % Make key matrix (Call key_to_img2)
% key_new2 = uint8(key_to_img2(og_img, key));


% [debug] Confirm that og_img and key_new2 are the same size
if ~isequal(size(encrypted_img), size(key_new2))
    disp('size issue'); %%REMOVE LATER, for debugging reasons
    size(encrypted_img);
    size(key_new2);
end


% Create encrypted image
% xor * key_new2 = encrypted img
% encrypted_img = double(xor_img) .* double(key_new2);
% encrypted_img = mod(encrypted_img, 256); %wraparound if needed

%%% SHOW ORIGINAL IMAGE
figure;
subplot(1, 5, 1);
imshow(encrypted_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('encrypted Image');
axis off;

%%% SHOW KEY 1
subplot(1, 5, 2);
imshow(key_new1, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Key new 1');
axis off;

%%% SHOW XOR IMAGE
subplot(1, 5, 3);
imshow(xor_img2, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('XOR Image (encrypt/keynew2)');
axis off;

%%% SHOW SPIRAL KEY
subplot(1, 5, 4);
imshow(key_new2, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('key 2 spiral');
axis off;

%%% SHOW FINAL IMAGE
subplot(1, 5, 5);
imshow(return_og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('og...');
axis off;


end
%=== RETURN OG_IMG FROM XOR_IMG (in turn from encrypted img)
% it is SO CLOSE, but there is definite variability

%%% THIS IS SUPER FUCKED UP NOW. NEED TO FIX DECRYPTION IF WE OFFER IT
% (& go through everything to debug. Make sure equations are all correct)
%%% xor_img - key_new1 = og_img 
% return_og_img = double(return_xor_img) - double(key_new1);
% return_og_img = mod(return_og_img, 256); % Wraparound if needed
% 
% %return_og_img = floor(mod(return_og_img, 256)); % Wraparound if needed
% 
% figure(4)
% imshow(return_og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
% title('OG Image (return from encrypted)');
% axis off;
% 


