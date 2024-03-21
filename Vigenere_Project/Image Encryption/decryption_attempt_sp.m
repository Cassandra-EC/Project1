%%%%%%%% messing around with a new script....
function return_og_img = decryption_attempt_sp(encrypted_img, key)
%%% Returns original image from return_xor_image and key. Final step in
%%% decryption


%=== LOAD XOR_IMG & KEY_NEW1
% both use encrypted_img as a size reference rather than og_img. Key is
% dependent on the size of image, rather than content

% xor
return_xor_img = return_xor(encrypted_img, key);

%%% key_new1
key_new1 = key_to_img1(encrypted_img, key);



%=== RETURN OG_IMG FROM XOR_IMG (in turn from encrypted img)
% it is SO CLOSE, but there is definite variability

%%% THIS IS SUPER FUCKED UP NOW. NEED TO FIX DECRYPTION IF WE OFFER IT
% (& go through everything to debug. Make sure equations are all correct)
%%% xor_img - key_new1 = og_img 
return_og_img = double(return_xor_img) - double(key_new1);
return_og_img = mod(return_og_img, 256); % Wraparound if needed

%return_og_img = floor(mod(return_og_img, 256)); % Wraparound if needed

figure(4)
imshow(return_og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('OG Image (return from encrypted)');
axis off;





end
