function key_new1 = key_to_img1(key, og_img)
%%%CREATE KEY_NEW1, AN IMAGE MADE FROM 'KEY' INPUT, THAT IS THE SIZE OF OG_IMG
    % SUMMARY: characters of key (in an abbreviated ASCII code) are assigned to numeric values.
    % these are then used to form an array of the same size as original [the
    % values of numeric_k iterate through rows to do this]

    %%% INPUTS:
        % key_new1 = key (numeric values), repeated to match length of og_img
        % og_img = original img input by user
    
    %%% OUTPUTS: image created from key

%=== ACQUIRE CURRENT SIZE OF KEY
colormap(gray);
length_k = length(key);

% numeric (double) version of key, accounting for desired ASCII start
numeric_k = double(key) - 32;

%=== MAKE KEY (NUMERIC) MATCH DIMENSIONS OF ORIGINAL IMAGE
%if key is larger than image, confirm if user wants these inputs
if length_k > numel(og_img)
    disp(strcat('Are you sure you want', {' '}, key, ' as your key?'));
    % some if yes do x, if no do y

    key_new1 = numeric_k;
    return;
    %return; %IF WE TRIM DO HERE
    %%%%instead of trim: error message, confirm user wanted that order

% IF KEY = SIZE OF OG_IMG, MOVE ON
elseif length_k == numel(og_img)
    key_new1 = numeric_k;
    key_new1 = reshape(key_new1, m, n);


% IF KEY < SIZE OF OG_IMG, REPEAT KEY TO MATCH SIZE
else 
    % creates a vector, length og_img, counting up from 0
    vector_og = 0:numel(og_img) - 1;
    
    % key_new1 = key, repeating until it's the size of img (call
    % remaining indices)
    key_new1 = numeric_k(mod(vector_og, length_k) + 1);
    key_new1 = reshape(key_new1, size(og_img)); %%need to confirm this works

end


%=== MAKE KEY_NEW1 FUNCTIONAL AS IMAGE (values 0-255)
key_new1 = mod(key_new1, 256);

%=== DISPLAY KEY_NEW1 AS AN IMAGE? ??????????????
colormap(gray);     %%% CHANGE IF WE DO 3 CHANNELS

% Show image; will scale to fit user's window & use values 0-255
imshow(key_new1, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');

end
