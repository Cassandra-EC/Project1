%%%% Visual Cryptography-- break image into 'shares'

% use a vigenere cipher on each 'share'
%%%% each share of color image can have own or diff key... maybe one key
%%%% for simplicity

%%% for each share, encrypt the r g b channels separately using the cipher
%%% same key is probably best, for ease...
%%% each pixel will be encrypted according to this
% diff vigenere cipher (key) for each color channel, but not for each share


% keep x shares assigned to various display outputs?

%%%could add decryption: decrypt using vigenere cipher (shift pixel values
%%%around

%%% now, can disp multiple shares overlaid (reveals image)

%