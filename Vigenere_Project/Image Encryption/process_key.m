% created 3/15/24 CC. Last edited 3/15/24 CC

function shared_key = process_key(og_img, key)
%%%CREATE SHARED FUNCTIONALITY THAT CAN BE USED BY KEY_TO_IMG 1 & 2
    
    % SUMMARY: characters of key (in an abbreviated ASCII code) are assigned to numeric values.
    % These are then used to form an array of the same size as original [the
    % values of numeric_k iterate through rows to do this]. 
    % First checks that size is appropriate/no clear errors

    %%% INPUTS:
        % key = text input by user
        % og_img = original img input by user
    
    %%% OUTPUTS: array created from key, matching size of og_img



%=== ACQUIRE CURRENT SIZE OF KEY AND OG_IMG
length_k = length(key);
size_og = numel(og_img);


%=== CREATE NUMERIC KEY
% numeric version of key, accounting for desired ASCII start (32 = space)
key_num = double(key) - 32;


%=== MAKE NUMERIC_K MATCH DIMENSIONS OF ORIGINAL IMAGE
%if key is larger than image, confirm if user wants these inputs
% IF KEY = SIZE OF OG_IMG, RESHAPE AND MOVE ON
if length_k == size_og
   shared_key = key_num;


% IF KEY < SIZE OF OG_IMG, REPEAT KEY TO MATCH SIZE
elseif length_k < size_og

    % update key_num to repeat until it's the size of og_img (call
    % remaining indices). May be longer (will trim)
    key_num = repmat(key_num, 1, ceil(size_og/length_k));
    
    % trim key_num to perfectly fit size_og
    shared_key = key_num(1:size_og);


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


%=== SCALE KEY TO SPAN 0-255 (only integer values)
% max_value = max(shared_key(:));

shared_key = mod(shared_key, 256);


% convert to uint8 (fit any outside values within range)
shared_key = uint8(shared_key);

%=== RESHAPE SHARED_KEY TO FIT OG_IMG
shared_key = reshape(shared_key, size(og_img));


end
