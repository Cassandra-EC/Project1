function encrypted_img = encrypt_my_img(og_img, key)
%%% ENCRYPT THE XOR TO GET FINAL ENCRYPTED IMG


%=== ACQUIRE SIZE OF KEY & OG_IMG
% (later will make image from key matching og)
length_k = length(key);
[m, n] = size(og_img);  % dimensions of og_img);

% numeric (double) version of key, accounting for desired ASCII start
numeric_k = double(key) - 32;


%=== MAKE 
%if key is larger than image, irrelevant; move on
if length_k > numel(og_img)
    disp(strcat('Are you sure you want', {' '}, key, ' as your key?'));
    % some if yes do x, if no do y

    key_new = numeric_k;
    %return; %IF WE TRIM DO HERE
    %%%%instead of trim: error message, confirm user wanted that order

% if key = size of img, move on
elseif length_k == numel(og_img)
    key_new = numeric_k;

% if length_p > length_k, repeat key until same length as plain
else 
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

