%%TO GENERATE CIPHERTEXT

% Make characters in key and plain lowercase
plain = lower(plain);
key = lower(key);

% Convert lowercase to corresponding numbers (ASCII)
numbers_plain = double(plain) - 97;
numbers_key = double(key) - 97; % -97 allows us to begin at 0

%cipher_m = zeros(length_plain);

% MAKE KEY SAME LENGTH AS PLAINTEXT
repeat_key = numbers_key;
while length(numbers_key) < length(numbers_plain)
    repeat_key = [repeat_key repeat_key]
end

% TRIM repeated key to length of plain
repeat_key = repeat_key(1:length(numbers_plain));

% ENCRYPT using the key and plain #s
cipher_numbers = numbers_key + numbers_plain;

if cipher_numbers >= 26 % 0 - 25
    cipher_numbers = cipher_numbers - 26 % Wrap around if exceeds bounds
end

% Converts (0-25) cipher numbers into lowercase ASCII
cipher = char(cipher_numbers + 97);
