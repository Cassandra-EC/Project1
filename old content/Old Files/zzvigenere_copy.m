%%TO GENERATE CIPHERTEXT
function cipher = encrypt(plain,key)
%%%%====ENCOUNTERING ISSUE WHEN EQUAL====%

% Make characters in key and plain lowercase
% plain = lower(plain); %get rid of this part
% key = lower(key);

% Acquire lengths of key and plain (later will ensure length_k = length_p)
length_k = length(key);
length_p = length(plain);
% Initialize cipher to be character vector, with same length as plain
cipher = char(zeros(1, length_p));   

%if key is longer than plain, irrelevant; move on
if length_k > length_p
    disp(strcat('Are you sure you want', {' '}, plain, ' as your plaintext?'));
    % some if yes do x, if no do y
    key_new = key;
    %return; %IF WE TRIM DO HERE
    %%%%instead of trim: error message, confirm user wanted that order

% if key = length of plain, move on
elseif length_k == length_p
    key_new = key;

% if length_p > length_k, repeat key until same length as plain
else 
    % creates a matrix, length of p, counting up from 0
    counting_p = 0:length_p - 1;
    
    % key_new = key, repeating until it's the length of plain (call
    % remaining indices)
    key_new = key(mod(counting_p, length_k) + 1);
end

% TRIM repeated key to length of plain
%repeat_key = repeat_key(1:length(numeric_plain));

% Convert text to matrix of corresponding numbers (ASCII)
% 'minus 32' bc only using ASCII 32 - 127, and setting 32 (space) to 0
numeric_p = double(plain) - 32;
numeric_k = double(key_new) - 32; 

%ENCRYPTION: add numeric values of each element plain & key to get
%corresponding cipher element
for ii = 1:length_p
    % Add p(ii) + k(ii) = c(ii). Cipher matrix fills with numeric values
    cipher(ii) = numeric_p(ii) + numeric_k(ii);
end

% Cipher wraparound; if any cipher element > 96, wrap to start
% [use 96 bc = (127-32 + 1). 127 (final ASCII) - 32 (1st used ASCII), + 1
% to account fo 0]
cipher = char(mod(cipher, 96) + 32);

disp(cipher);
end
