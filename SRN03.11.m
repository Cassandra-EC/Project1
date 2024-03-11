function cipher = Vigenere1(plain,key)

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


end
%for ii = 1:length(plain)

%if statement needed here?
%modulo((plain_text(ii) + key(ii))26) = cipher(ii);
% [24 6 14 27 15]
% end