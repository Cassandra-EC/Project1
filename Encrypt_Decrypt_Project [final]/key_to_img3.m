% created 3/22 CC

function key_new3 = key_to_img3(og_img, key)

%%% KEY_TO_IMG3 outputs an image constructed from key_new1 and key_new2,
% which in turn are both created from the og_img and the key. Once both
% key_new1 and key_new2 are generated, key_new3 is created with element-wise
% multiplication between both images. The formula is as follows: 
% (88 + key_new1) .* key_new2. Then, to keep the pixel values within RGB
% range, a modulo operation is applied.

%%% SUMMARY: create an image by combining key_new1 and key_new2

    %%% INPUTS:
        % og_img = an original input image
        % key = text (ASCII characters) used to encrypt the og_img
    
    %%% OUTPUTS: 
        % key_new2 = a new image made using both key_new1 and key_new2

%%% CALL KEY_TO_IMG1 and KEY_TO_IMG2 
key_new1 = key_to_img1(og_img, key);
key_new2 = key_to_img2(og_img, key);

%%% CREATE KEY_NEW3 from KEY_NEW1 and KEY_NEW2
key_new3 = (88 + double(key_new1)) .* double(key_new2); 
% [adding 88 is just an homage to one of our star coders.]

key_new3 = mod(key_new3, 256);      % wrap around values >255
key_new3 = uint8(key_new3);  

end


