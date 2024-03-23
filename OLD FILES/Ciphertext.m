%%TO GENERATE CIPHERTEXT
function cipher = encrypt(plain,key)

% Make characters in key and plain lowercase
plain = lower(plain); %get rid of this part
key = lower(key);

% Convert lowercase to corresponding numbers (ASCII)
% 'minus 32' bc only using ASCII 32 - 127, and setting 32 (space) to 0
numeric_p = double(plain) - 32;
numeric_k = double(key) - 32; 

length_k = length(key);
length_p = length(plain);


%one at a time
%%if key < half the length of plain

%if key is longer than plain, irrelevant; move on
if length_k > length_p
    return; %IF WE TRIM DO HERE

% if key = length of plain, move on
elseif length_k == length_p
    return;

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

% ENCRYPT using the key and plain #s
numeric_cipher = numeric_k + numeric_p;

if numeric_cipher >= 26 % 0 - 25
    numeric_cipher = numeric_cipher - 26; % Wrap around if exceeds bounds
end

% Converts (0-25) cipher numbers into lowercase ASCII
cipher = char(numeric_cipher + + 32);

disp(cipher);
end
