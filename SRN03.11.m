function cipher = Vigenere1(plain,key)

% Make characters in key and plain lowercase
plain = lower(plain);
key = lower(key);

% Convert lowercase to corresponding numbers

length_plain = length(plain_m); %how to get length of string????
length_key = length(key_m);
cipher_m = zeros(length_plain);

%%%BOTH INPUTS BECOME NUM MATRICES
%both plain &  key need to become vectors of same length
1) separate characters into matrix
2) characters -> numbers
%& corresponding numbers (a = 0, z = 25)
%'lemon' -> [11 4 12 14 13], key [13 2 3 13 2]


%%MAKE KEY SAME LENGTH AS PLAINTEXT
if length_key < length_plain
    %repeat enough to fit same length
end


for ii = 1:length(plain)

%if statement needed here?
modulo((plain_text(ii) + key(ii))26) = cipher(ii);
% [24 6 14 27 15]
% end