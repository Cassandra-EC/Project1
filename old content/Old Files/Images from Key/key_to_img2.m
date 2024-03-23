% created 3/15/24 CC. Last edited 3/15/24 CC

function key_new2 = key_to_img2(key, og_img)
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
        % process_key = array from key, same size as og_img

    %%% OUTPUTS: image created from adapted key
        % key_new2

%=== REDECLARE KEY SO EACH CHAR IS DOUBLED

% each char of key is doubled (repeated once)
key = repelem(key, 2);

%=== REPEAT EACH CHARACTER OF NUMERIC_K (numeric version of key)
% call shared_key (but with new, doubled version of key)
key_new2 = process_key(key, og_img);

imshow(key_new2, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');



end