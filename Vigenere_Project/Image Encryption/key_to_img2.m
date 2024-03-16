% created 3/15/24 CC. Last edited 3/15/24 CC 
% using underlying code from SN]

function key_new2 = key_to_img2(og_img, key)
    % SUMMARY: characters of key are used to form an array of same size as
    % og_img (like in key_to_img1. This array will be used to encrypt
    % (doubly!) xor_img and give us our final encrypted output.

    % 2 major differences from key_to_img1: 1) key characters spiral outwards, rather than
    % moving along rows; 2) within the key, each char repeats twice (e.g.
    % cat -> ccaatt). These will perform better encryption for the final
    % image

    %%% INPUTS:
        % key = text input by user (vector)
        % og_img = original img input by user (array)

    %%% OUTPUTS: image created from adapted key
        % key_new2: values of key (doubled, scaled) repeat in a spiral

%=== REDECLARE KEY SO EACH CHAR IS DOUBLED
% save original copy
key_copy = key;

% each char of key is doubled (repeated once)
key = repelem(key, 2);


%=== REPEAT EACH CHARACTER OF NUMERIC_K (numeric version of key)
% call shared_key (but with new, doubled version of key)
key_new2 = process_key(key, og_img);


%=== CREATE SPIRAL PATTERN OF KEY_NEW2
[rows, cols] = size(key_new2);

% reshape key_new2 into a column vector
key_col = key_new2(:);

% rearrange key_new2 elements into a spiral
key_new2 = reshape(key_col(spiral(rows, cols)), rows, cols);



%=== SHOW KEY_NEW2
imshow(key_new2, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');


%=== RESTORE ORIGINAL VERSION OF KEY (no repeats)
key = key_copy;










end



