%% Created 03/22 SP. 

function start()
%%% START 'starts' a dialog tree, guiding a user through either encryption
% or decryption. If the user chooses 'Encrypt', the function calls
% dialog_input and assigns the outputs to og_img and key. Then, og_img and
% key are fed into encrypt_my_img. If the user chooses 'Decrypt', the
% function calls dialog_input and assigns the outputs to encrypted_img and
% key. Then, encrypted_img and key are fed into decrypt_my_img. 

% For encryption, this outputs an encrypted image and a process image that
% shows how we encrypted the image. For decryption, the output is a
% 'decrypted' image-- not identical to the og_img, but legible.

%%% SUMMARY: Guide's user through encryption or decryption.
    
    %%% OUTPUTS: 
        % decrypted_img = a image made by decrypting encrypted_img with key
        % encrypted_img = a new image made using both og_img and the key

% ASK USER choice
choose = questdlg("What would you like to do?", 'Encryption or Decryption', 'Encrypt', 'Decrypt', 'Cancel', 'Encrypt');

% Check choice and call correct function
if strcmp(choose, 'Encrypt')
    % Encrypt image with key
    [og_img, key] = dialog_input;
    encrypt_my_img(og_img, key);

elseif strcmp(choose, 'Decrypt')
    % Decrypt iamge with key
    [encrypted_img, key] = dialog_input;
    decrypt_my_img(encrypted_img, key);

elseif strcmp(choose, 'Cancel')
    % Cancel
    disp('Canceled.');

else
    disp('Error: Invalid choice.');
end