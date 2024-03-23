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
![Demo](https://private-user-images.githubusercontent.com/162471376/316218795-aad45481-2e5e-44e6-b318-44b09664f5b3.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTExNzExNjQsIm5iZiI6MTcxMTE3MDg2NCwicGF0aCI6Ii8xNjI0NzEzNzYvMzE2MjE4Nzk1LWFhZDQ1NDgxLTJlNWUtNDRlNi1iMzE4LTQ0YjA5NjY0ZjViMy5naWY_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMzIzJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDMyM1QwNTE0MjRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mNTQ5NTcyNzdmN2QxZTU2ZjhjOWIxNTE4MTMyMDZjMzk0OTViYjZhNDdmYWI3MDgzODNmM2RhZTRjNjBjMmQzJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.lcGn_XF6J8N5TR6tsfIedCB3MMJqJIinhY74lF8n7nc)

