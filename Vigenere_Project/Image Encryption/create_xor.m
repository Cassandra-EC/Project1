% created 3/15/24 CC. Last edited 3/16/24 CC

function xor_img = create_xor(og_img, key)
%%% The 'XOR' is the difference between each value of the og_img and the
%%% key_img. Each pixel is a subtraction.


%%% USE SIMPLE_KEY_IMG TO CREATE XOR

% subtract key_new1 values from og_img (may produce negative values)
key_new1 = key_to_img1(key, og_img);
key_new1 = double(key_new1);


 % Check the data types of og_img and key_new1
    disp(['size of og_img: ', size(og_img)]);
    disp(['size of key_new1: ', size(key_new1)]);

xor_img = og_img + key_new1;
xor_img = mod(xor_img, 256);


%=== DISPLAY XOR_IMG (for now)
% scale image to fit the window (whether too big/small)
imshow(xor_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');

end


