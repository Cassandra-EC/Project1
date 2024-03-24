% created 3/15/24 CC. Edited 3/15/24 CC
% edited CC 3/22/24. Last edited CC 3/23/24

function shared_key = process_key(og_img, key)
    % PROCESS_KEY takes characters of key (in an abbreviated ASCII code) & 
    % assigns each to a numeric value. These are then used to form an 
    % array of the same size as the original img [the values of key_num 
    % iterate through rows to do this]. First checks that size is appropriate/
    % no clear errors.
    % This output (shared_key) is used for both key_new1 & key_new2, which 
    % are then multiplied & added to og_img to create the encrpted img
    
    % SUMMARY: creates a matrix corresponding to characters of the key.
    % These are repeated through rows to create a matrix the same size as 
    % og_img. shared_key used to create both key_new1 & key_new2

 
    %%% INPUTS:
        % og_img = an original input image
        % key = text (ASCII characters) used to encrypt the og_img
    
    %%% OUTPUTS: 
        % shared_key = array created from key, matching size of og_img


%=== ACQUIRE CURRENT SIZE OF KEY AND OG_IMG
length_k = length(key);
size_og = size(og_img);
num_layers = size_og(3);
size_og_layer = prod(size_og(1:2)); % # elements in each layer of og_img


%=== CREATE NUMERIC KEY
% numeric version of key, accounting for desired ASCII start (32 = space)
key_num = double(key) - 32;


%=== MAKE KEY_NUM MATCH DIMENSIONS OF ORIGINAL IMAGE
%if key is larger than image, confirm if user wants these inputs
% IF KEY = SIZE OF OG_IMG, RESHAPE AND MOVE ON
if length_k == size_og_layer
   shared_key = key_num;

% IF KEY < SIZE OF OG_IMG, REPEAT KEY TO MATCH SIZE
elseif length_k < size_og_layer
    % update key_num to repeat until it's the size of 1 og_img layer (call
    % remaining indices). May be longer (will trim)
    key_num = repmat(key_num, 1, ceil(size_og_layer/length_k));
    
    % trim key_num to PERFECTLY fit size of 1 og_img layer
    shared_key = key_num(1:size_og_layer);



% IF KEY > SIZE_OG, ASK USER IF WHETHER TO 1) TRIM OR 2) USE NEW INPUTS
else 
    % request user input (Y/N) on whether to trim or use new input
    userInput = input(['The length of the key exceeds the size of the image.' ...
        'Do you wish to proceed anyway? (Y/N): '], 's');
    
    if strcmpi(userInput, 'Y') || strcmpi(userInput, 'Yes')
        % Yes: trim key_num to match size of og_img
        shared_key = key_num(1:size_og);

    else
        % return wsithout modifying key
        disp('Returning original key. Please submit new inputs.');
        return;
    end
end


%=== TRIPLICATE SHARED_KEY LAYERS IF NECESSARY
if num_layers >1
    shared_key = repmat(shared_key, [1, 1, 3]);
end


%=== SCALE KEY TO SPAN 0-255 (only integer values)
% max_value = max(shared_key(:));

shared_key = mod(shared_key, 256);


% convert to uint8 (fit any outside values within range)
shared_key = uint8(shared_key);

%=== RESHAPE SHARED_KEY TO FIT OG_IMG
shared_key = reshape(shared_key, size(og_img));


end
