
encrypted_img = encrypt_my_img(og_img, key);

 
%=== 3-CHANNEL OG_IMG INPUT [RED,GREEN]
og_img=zeros(30,40,3); %initialize
 og_img(:,1:10,1)=0.5;   %Red (dark red)
 og_img(:,11:20,1)=1;   %Red (maximum value)
 og_img(1:10,:,2)=rand(10,40);  %Green
 figure, imshow(og_img)



%=== 3-CHANNEL, SIMPLE OG_IMG INPUT
og_img=zeros(20,10,3); %initialize
og_img(:,1:5,1) = 120;   %Red (dark red)
og_img(:,6:10,1) = 255;   %Red (maximum value)
og_img(1:10,:,2)= 200;  %Green



%%
%=== color img
% Define image dimensions
rows = 10;
cols = 20;

% Initialize RGB image matrix
og_img = zeros(rows, cols, 3);

% Define RGB values
red_values = linspace(0, 255, cols);      % Varying red values
green_values = linspace(0, 255, rows);    % Varying green values
blue_values = linspace(0, 255, cols);     % Varying blue values

% Assign colors to different regions of the image
for i = 1:rows
    for j = 1:cols
        og_img(i, j, 1) = red_values(j);        % Varying red horizontally
        og_img(i, j, 2) = green_values(i);      % Varying green vertically
        og_img(i, j, 3) = blue_values(j);       % Varying blue horizontally
    end
end




 


