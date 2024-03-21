% created 3/15/24 CC. Edited 3/16/24 CC
% Last edited 3/16/24 SP

function xor_img = create_xor(og_img, key)
%%% The 'XOR' is the difference between each value of the og_img and the
%%% key_img. Each pixel is a subtraction.


%%% USE SIMPLE_KEY_IMG TO CREATE XOR
% add key_new1 values to og_img (may produce value >255)
key_new1 = key_to_img1(og_img, key);
key_new1 = uint8(key_new1); 

xor_img = double(og_img) + double(key_new1); 

% wrap around values >255
xor_img = mod(xor_img, 256);
xor_img = uint8(xor_img);


% %=== SHOW XOR (for debugging, comment out if not needed)
% imshow(xor_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
% title('XOR Image (from creation)');
% axis off;

end


