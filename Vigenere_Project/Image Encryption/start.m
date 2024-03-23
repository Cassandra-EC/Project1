%%%%%% our beginnning script for people to call

%%%%%%%
function start()

choose = questdlg("What would you like to do?", 'Encryption or Decryption', 'Encrypt', 'Decrypt', 'Cancel', 'Encrypt');

% Check choice and call correct function
if strcmp(choose, 'Encrypt')
    [og_img, key] = dialog_input;
    encrypt_my_img(og_img, key);
elseif strcmp(choose, 'Decrypt')
    [encrypted_img, key] = dialog_input;
    decrypt_my_img(encrypted_img, key);
elseif strcmp(choose, 'Cancel')
    disp('Canceled.');
else
    disp('Error: Invalid choice.');
end
