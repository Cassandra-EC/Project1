function encrypted_img = encrypt_my_img(og_img, key)


%=== ALLOW FOR IMAGE UPLOAD (link, copy/paste, multiple options????)





%=== ENCRYPT THE XOR TO GET FINAL ENCRYPTED IMG
% xor_img + key_new2 = encrypted_img
create_xor(og_img, key);
key_to_img2(og_img, key);

encrypted_img = create_xor + key_to_img2;

imagesc(shared_key));
colormap(gray);
title('Key as Image');
colorbar;



%=== ACQUIRE SIZE OF KEY & OG_IMG
% (later will make image from key matching og)
length_k = length(key);
[m, n] = size(og_img);  % dimensions of og_img);

% numeric (double) version of key, accounting for desired ASCII start
numeric_k = double(key) - 32;


%=== Check length of key compared to image
if length_k > numel(og_img)
    user_input = input(['The length of the key is longer than the # of elements in your image!', ...
        'Are you sure you want"', key, '" as your key? (yes/no): '], 's');
    user_input = lower(user_input) % to avoid case-sensitive issues
    
    if strcmp(user_input, 'no') 
        % if user made mistake, enter new key
        key = input('Please enter your new key: ', 's')
    elseif ~strcmp(user_input, 'yes');
        disp('Try again. Please enter "yes" or "no".');
        return;
    end
end

% Numeric key, accounting for ASCII range
numeric_k = double(key) - 32;

% Make new key vector match the size of the original image
if length_k < numel(og_img)
    % Repeat the key until it matches og_img size
    repeat_n = ceil(numel(og_img) / length_k);
    key_new = repmat(numeric_k, 1, repeat_n);
    key_new = key_new(1:numel(og_img));
else
    key_new = numeric_k;
end

% Reshape new key to match image size
key_




    % creates a vector, length og_img, counting up from 0
    vector_og = 0:numel(og_img) - 1;
    
    % key_new = key, repeating until it's the size of img (call
    % remaining indices)
    key_new = key(mod(vector_og, length_k) + 1);
    reshape(key_new, m, n);
end




end



%%%% NOTES FROM ORIGINAL VIGENERE:
%{
% Acquire size of key & og_img (later will make image from key matching og)
length_k = length(key);
[m, n] = size(og_img);  % dimensions of og_img);

%if key is larger than image, irrelevant; move on
if length_k > numel(og_img)
    disp(strcat('Are you sure you want', {' '}, key, ' as your key?'));
    % some if yes do x, if no do y

    key_new = key;
    %return; %IF WE TRIM DO HERE
    %%%%instead of trim: error message, confirm user wanted that order

% if key = size of img, move on
elseif length_k == numel(og_img)
    key_new = key;

% if length_p > length_k, repeat key until same length as plain
else 
    % creates a vector, length og_img, counting up from 0
    vector_og = 0:numel(og_img) - 1;
    
    % key_new = key, repeating until it's the size of img (call
    % remaining indices)
    key_new = key(mod(vector_og, length_k) + 1);
    reshape(key_new, m, n);
end

% TRIM repeated key to length of plain
%repeat_key = repeat_key(1:length(numeric_plain));

% Convert text to matrix of corresponding numbers (ASCII)
% 'minus 32' bc only using ASCII 32 - 127, and setting 32 (space) to 0
numeric_p = double(plain) - 32;
numeric_k = double(key_new) - 32; 


%}

