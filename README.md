# Project1
Repository for CLPS 0950 project 1 [cipher?]; C + S

[Need to edit README!]

Function creates scrambled, 'encrypted' image from two user inputs: a 'key' [ASCII values 32-127] and an 'og_img' [original image uploaded by user, in the form of a ___ or ___]. Steps of this include: 
  1) forming the key (through repetition and wrapping over columns/rows??) into a matrix with the same dimensions as og_img
  2) subtracting(ACTUALLY WANTED TO ADD, JUST REMEMBERED) this 'key_new1' from the og_img to return an intermediate 'xor_img'
  3) forming the key (through a spiral from the center) into a matrix with the same dimensions as og_img
  4) adding this 'key_new2' to the intermediate 'xor_img' to provide the final, encrypted image.

FUNCTIONALITY: 
  Use 'encrypt_my_img(og_img, key)' to get a scrambled image.
  Use 'decrypt_my_img(encrypted_img, key)' to return the original image (e.g. if a friend sent an encrypted image and the key word used to generate it!)

**Longer/more intricate keys will generate more intricate encryptions.
