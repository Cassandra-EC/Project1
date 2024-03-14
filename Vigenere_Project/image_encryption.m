%%%% Visual Cryptography-- break image into 'shares'
% for i = 1:num_shares
%loop through processes for creating one encrypted share technique


% use a vigenere cipher on each 'share'
%%%% each share of color image can have own or diff key... maybe one key
%%%% for simplicity

%%% for each share, encrypt the r g b channels separately using the cipher
%%% same key is probably best, for ease...
%%% each pixel will be encrypted according to this
% diff vigenere cipher (key) for each color channel, but not for each share

%%%% for channel 1-3
    %key_share_channel = image (specific channel) [:,:, channel] + random
    %share [ :, : , channel]

    %%encrypt key share channel using vigenere cipher, key
% keep x shares assigned to various display outputs?

%%%could add decryption: decrypt using vigenere cipher (shift pixel values
%%%around

%%% now, can disp multiple shares overlaid (reveals image)

% technique?
    %generate random shares to be random values (matrix size of original
    %image, so m x n x 3) 

    %The values of a UINT8 range from 0 to 255, scale things to be from
    %0-255 (those randomly generated values)




    %%RKO technique for color visual cryptography has 3 steps:
%%Step 1(Random share generation): Substitute any random values for R,G and B for each pixel in original image to create a random share. The size of the share is same as the original image.
%%step 2 (Key share generation): Perform pixel-by- pixel XOR operation on random share with original image to generate key share. The size of this share is also same as the original image.
%%step 3 (Overlapping of the shares) : Perform XOR operation on random share with the key share pixel by pixel to reconstruct the original image.
%%Algorithm RKO ( )
%%{ For every pixel i=0 to n{
%%RSi = R(0-255) + G(0-255) + B(0-255)
%%KSi = RSi ⊕ OIi}
%%OI = RS ⊕ KS} 
% /* OI = Original Image , KS= Key Share , RS= Random Share*/

