function draftkey_new2 = key_to_img2(key, og_img)
    % SUMMARY: characters of key are used to form an array of same size as
    % og_img (like in key_to_img1. This array will be used to encrypt
    % (doubly!) xor_img and give us our final encrypted output.

    % 2 major differences from key_to_img1: 1) key characters spiral outwards, rather than
    % moving along rows; 2) within the key, each char repeats twice (e.g.
    % cat -> ccaatt). These will perform better encryption for the final
    % image

    %%% INPUTS:
        % key = original text input by user (vector)
        % og_img = original img input by user (array)
    %%% OUTPUTS: image created from adapted key
        % this image 

%=== REPEAT EACH CHARACTER OF NUMERIC_K (numeric version of key)




end