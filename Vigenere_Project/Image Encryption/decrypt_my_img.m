% created 3/15/24 CC. Edited 3/17/24 SN. Edited 3/18 CC
% edited 3/22 CC. 

function return_og_img = decrypt_my_img(encrypted_img, key)
%%% Returns original image from return_xor_image and key. Final step in
%%% decryption
%%%% CC:ERROR ADD SUMMARY ADD INPUTS ADD OUTPUTS

%=== 'UNROTATE' encrypted_img (was rotated 180 before)
encrypted_img = imrotate(encrypted_img, 180);

%=== LOAD KEY3, using encrypted_img as size reference
key_new3 = key_to_img3(encrypted_img, key);


%=== RETURN OG_IMG
return_og_img = encrypted_img - key_new3;
return_og_img = mod(return_og_img, 256); % Wraparound if needed
return_og_img = uint8(return_og_img);


% show (decrypted) og_img 
figure;
subplot(1,2,1);
imshow(return_og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('OG Image (returned from encrypted img)');
axis off;

%%% FOR DEBUGGING USE TEST_IMG and show original
subplot(1,2,2);
test_img = test();
imshow(test_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('actual og (test!!)');
axis off;

end



% % both use encrypted_img as a size reference rather than og_img. Key is
% % dependent on the size of image, rather than content
% 
% % xor
% return_xor_img = return_xor(encrypted_img, key);
% 
% %%% key_new1
% key_new1 = key_to_img1(encrypted_img, key);
% 
% % key_new2
% key_new2 = key_to_img2(size(encrypted_img), key);
% key_new2 = uint8(key_new2);

%=== RETURN OG_IMG FROM XOR_IMG (in turn from encrypted img)
% it is SO CLOSE, but there is definite variability


% %%% THIS IS SUPER FUCKED UP NOW. NEED TO FIX DECRYPTION IF WE OFFER IT
% % (& go through everything to debug. Make sure equations are all correct)
% %%% xor_img - key_new1 = og_img 
% not_zero_indices = key_new2 ~= 0; %when reciprocal key_new2 is not 0
% return_og_img = (return_xor_img);
% return_og_img(not_zero_indices) = return_og_img(not_zero_indices) .* key_new2(not_zero_indices);
% 
% 
% %return_og_img = double(return_xor_img) .* (reciprocal_key_new2); %issue with 0 as divisor??
% return_og_img = mod(return_og_img, 256); % Wraparound if needed
% return_og_img = uint8(return_og_img);
% 
% figure(4)
% imshow(return_og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
% title('OG Image (return from encrypted)');
% axis off;
% 
% end
% 
