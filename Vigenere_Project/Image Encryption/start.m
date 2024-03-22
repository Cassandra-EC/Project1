%%%%%% our beginnning script for people to call

%%%%%%%

shift some things out of image dialoge to make it broader 
for also decryption or encryption


  %%%n info
  choose encrypt or decrypt

  encrypt --> dialog , upload and set it to 'image'

%%%%  save og_img or img as variable

  if % Encrypt!
         encrypted_img = encrypt_my_img(og_img, key);
         disp('Encryption successful!');
         break; % Exit loop
