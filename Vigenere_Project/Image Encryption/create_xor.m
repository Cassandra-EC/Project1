% created 3/15/24 CC. Edited 3/16/24 CC
% Last edited 3/16/24 SP

function xor_img = create_xor(og_img, key)
%%% The 'XOR' is the difference between each value of the og_img and the
%%% key_img. Each pixel is a subtraction.


%%% USE SIMPLE_KEY_IMG TO CREATE XOR

% subtract key_new1 values from og_img (may produce negative values)
key_new1 = key_to_img1(key, og_img);
key_new1 = uint8(key_new1); 

xor_img = double(og_img) - double(key_new1); % IT WAS ADDITION SOBBING LOL
xor_img = uint8(xor_img);
xor_img = mod(xor_img, 256);


%=== DISPLAY XOR_IMG (for now)
% scale image to fit the window (whether too big/small)
imshow(xor_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');

end


