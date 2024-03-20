% created 3/15/24 CC. Edited 3/17/24 SN
% edited 3/18/24 CC. Renamed from 'undo_xor' to 'return_xor' [now actually
% true to purpose]

%%%Test/debugging:
% subplot(1,2,1);
% xor_img = create_xor(og_img, key);
% 
% subplot(1,2,2);
% return_xor_img = return_xor(encrypted_img, key);

%%% However, due to a bug I dealt with here/future bugs: I think we should
% confirm we properly understand what those mean and slowly read through
% all code to 1) remove those & 2) only put them where strictly needed.
% Have kind of been using them/throwing them out whenever something isn't
% working, which may be causing issues down the line.



function return_xor_img = return_xor(encrypted_img, key)
%%% Returns xor_image from the encrypted image and key


%=== GET SPIRAL IMAGE BACK FROM KEY
% Make key into 2nd (spiral) image again, using key input
key_new2 = key_to_img2(encrypted_img, key);
key_new1 = key_to_img1(encrypted_img, key)


%=== RETURN XOR FROM ENCRYPTED IMAGE
% They seem to be identical! 3/17

%%% encrypted_img - key_new2 = xor_img 
% xor * key_new2 = encrypted img
%% SP just changed this to subtraction since create is addition? changed to keynew1
return_xor_img = double(encrypted_img) + double(key_new2); %if we subtract, addition reverses the operation
return_xor_img = mod(return_xor_img, 256); % Wraparound if needed
return_xor_img = uint8(return_xor_img);

figure;
imshow(return_xor_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('XOR Image (return from encrypted)');
axis off;

end