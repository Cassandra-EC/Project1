
%=== 3-CHANNEL OG_IMG INPUT [RED,GREEN]
og_img=zeros(30,40,3); %initialize
 og_img(:,1:10,1)=0.5;   %Red (dark red)
 og_img(:,11:20,1)=1;   %Red (maximum value)
 og_img(1:10,:,2)=rand(10,40);  %Green
 figure, imshow(og_img)


 %=== 3-CHANNEL OG_IMG INPUT [RED,GREEN]
og_img=zeros(30,40,3); %initialize
 og_img(:,1:10,1)=120;   %Red (dark red)
 og_img(:,11:20,1)=255;   %Red (maximum value)
 og_img(1:10,:,2)=randi();  %Green
 figure, imshow(og_img)

%=== 3-CHANNEL, SIMPLE OG_IMG INPUT
og_img=zeros(20,10,3); %initialize

og_img(:,1:5,1) = 120;   %Red (dark red)

og_img(:,6:10,1) = 255;   %Red (maximum value)

og_img(1:10,:,2)= 200;  %Green



 
 encrypted_img = encrypt_my_img(og_img, key);


