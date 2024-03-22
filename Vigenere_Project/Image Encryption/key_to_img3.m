% created 3/15/24 CC. Edited 3/16/24 CC
% Last edited 3/16/24 SP
% NEW BRANCH: changed from create_xor to key_new3

function key_new3 = key_to_img3(og_img, key)
%%% FIX THIS PART
%%%% CC:ERROR ADD SUMMARY ADD INPUTS ADD OUTPUTS


%%% USE SIMPLE_KEY_IMG TO CREATE XOR
% add key_new1 values to og_img (may produce value >255)
key_new1 = key_to_img1(og_img, key);
key_new2 = key_to_img2(og_img, key);

key_new3 = (88 + double(key_new1)) .* double(key_new2); 
% [adding 88 is just an homage to one of our star coders. can be
% removed/changed]
key_new3 = mod(key_new3, 256);      % wrap around values >255
key_new3 = uint8(key_new3);  


% USE FOR DEBUGGING
% imshow(key_new3, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
% title('KEY3');
% axis off;


end


