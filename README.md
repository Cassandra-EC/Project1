# Project1
Repository for CLPS 0950 project 1 encrypt_decrypt; C + S

Function creates scrambled, 'encrypted' image from two user inputs: a 'key' [ASCII values 32-127] and an 'og_img' [original image uploaded by user, in the form of a file upload, url, or matrix of their own creation]. Steps of this include: 
  1) forming the key (through repetition and wrapping over columns) into a matrix 'key_new1' with the same dimensions as og_img
  2) forming the key (through spiraling a modified version of the key, made with each character repeated 1x before the next) into a matrix key_new2 with the same dimensions as og_img 
  3) forming a matrix key_new3, through element-wise multiplication of key_new1 (+88, just for fun) & key_new2
  4) adding this 'key_new3' TO the original image to provide the final, encrypted image.
  5) this encrypted image may be saved to a file of the user's choosing. The automatic title will be the key they used, so it is not forgotten.

An additional 'decrypt' function allows a separate user without the og_img to input the encrypted_img and key, in order to receive a (modified and still somewhat scrambled!!) version of the original image.

FUNCTIONALITY: 
  WRITE 'start' IN THE COMMAND WINDOW
  CHOOSE WHETHER TO ENCRYPT OR DECRYPT
  FOLLOW THE DIALOGUE CUES TO UPLOAD AN IMAGE (url, file upload, create a matrix) AND A KEY (accepts ASCII characters 32-127)

**Longer/more intricate keys will generate more intricate encryptions! (and be difficult to decrypt :D )
