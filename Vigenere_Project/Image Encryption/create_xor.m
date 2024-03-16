% created 3/15/24 CC. Last edited 3/15/24 CC

function xor_img = create_xor(og_img, key_new1)
%%% The 'XOR' is the difference between each value of the og_img and the
%%% key_img. Each pixel is a subtraction.

%%% USE SIMPLE_KEY_IMG TO CREATE XOR


% subtract key_new1 values from og_img (may produce negative values)
xor_img = og_img - key_new1;
xor_img = mod(xor_img, 256);


%=== DISPLAY XOR_IMG (for now)
% scale image to fit the window (whether too big/small)
imshow(xor_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');

end


