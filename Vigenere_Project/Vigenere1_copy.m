%function cipher = Vigenere1(plain,key)



%VIGENERE1 takes plaintext and key to produce encrypted version of plain
%matrix for plain text, separate cells

%num2cell(plain): split into separate 1x1 cell arrays
%plain(2): already calls 2nd letter of plain

%length_p = length(plain); %how to get length of string????
%length_k = length(key);
%cipher = zeros(length_p);


%%%%%FOR IF YOUR INPUTS ARE INVALID
%%% summary: User must resubmit inputs if not purely alphabetical characters (no
%%% spaces, no punctuation

%if a member of plain is not in alphabet, ask for new input
if isNotAlphabet(plain) || isNotAlphabet(key)
    disp('Your input is invalid.');
    disp('Please try again with no spaces or other non-alphabetical characters.')
    return;
end
%%%%%



%{
%%%BOTH INPUTS BECOME NUM MATRICES
%both plain &  key need to become vectors of same length
1) separate characters into matrix
2) characters -> numbers
%& corresponding numbers (a = 0, z = 25)
%'lemon' -> [11 4 12 14 13], key [13 2 3 13 2]





%SOPHIA
%MAKE KEY SAME LENGTH AS PLAINTEXT [sophia]
if length_key < length_plain
    %repeat enough to fit same length
end


%
%SOPHIA
for ii = 1:length(plain)

%if statement needed here?
modulo((plain_text(ii) + key(ii))26) = cipher(ii);
% [24 6 14 27 15]
% end

%%ALREADY HAVE COMPLETE CIPHER MATRIX, values 0-25
%cipher_m = [];


%CASSANDRA
%%CONVERT CIPHER_M TO 1 STRING OF LETTERs
%matlab functions to help here? -> cipher

disp(cipher);


%}

end