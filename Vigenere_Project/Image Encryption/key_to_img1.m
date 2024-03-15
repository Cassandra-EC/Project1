function simple_key_img = key_to_img1(key, og_img)
%%%CREATE AN IMAGE OF KEY, THAT IS THE SIZE OF OG_IMG
% Done 'simply'; iterate word throughout each row

    %%% Inputs:
    % key_new = key, repeated to match length of og_img
    % og_img = original img input by user

    %%%outputs: image created from key


%=== ACQUIRE CURRENT SIZE OF KEY
length_k = length(key);

% numeric (double) version of key, accounting for desired ASCII start
numeric_k = double(key) - 32;


%=== MAKE KEY (NUMERIC) MATCH DIMENSIONS OF ORIGINAL IMAGE
%if key is larger than image, confirm if user wants these inputs
if length_k > numel(og_img)
    disp(strcat('Are you sure you want', {' '}, key, ' as your key?'));
    % some if yes do x, if no do y

    key_new = numeric_k;
    return;
    %return; %IF WE TRIM DO HERE
    %%%%instead of trim: error message, confirm user wanted that order

% if key = size of img, move on
elseif length_k == numel(og_img)
    key_new = numeric_k;
    key_new = reshape(key_new, m, n);


% if size of og_img > length_k, repeat numeric_k to match
else 
    % creates a vector, length og_img, counting up from 0
    vector_og = 0:numel(og_img) - 1;
    
    % key_new = key, repeating until it's the size of img (call
    % remaining indices)
    key_new = numeric_k(mod(og_img, length_k) + 1);
    key_new = reshape(key_new, size(og_img)); %%need to confirm this works

end


% MAKE KEY_NEW FUNCTIONAL AS IMAGE (values 0-255)
key_new = mod(key_new, 256);
sized = size(key_new)


end
