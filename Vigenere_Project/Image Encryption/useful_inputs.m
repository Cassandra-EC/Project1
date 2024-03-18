


subplot(1,2,2);
decrypted_img = decrypt_my_img(encrypted_img, key);

%=== CREATE VS RETURN XOR
subplot(1,2,1);
xor_img = create_xor(og_img, key);

subplot(1,2,2);
return_xor_img = return_xor(encrypted_img, key);

%=== CREATE VS RETURN OG

subplot(1,2,1);
imshow(og_img, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');
title('Original Image');
axis off;

subplot(1,2,2);
return_og_img = decrypt_my_img(encrypted_img, key);





 
%=== 3-CHANNEL OG_IMG INPUT [RED,GREEN]
og_img=zeros(30,40,3); %initialize
 og_img(:,1:10,1)= 15;   %Red (dark red)
 og_img(:,11:20,1)=100;   %Red (maximum value)
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
og_img = zeros(10, 20, 3);

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


%%
%====FLOWER ON PURPLE BACKGROUND
og_img = zeros(50, 30, 3, 'uint8'); % RGB image

% Create a light purple gradient background
gradient_color = [230, 200, 255]; % Light purple color
og_img(:, :, :) = repmat(reshape(gradient_color, [1, 1, 3]), [50, 30, 1]);

% Create a flower pattern
[x, y] = meshgrid(1:size(og_img, 2), 1:size(og_img, 1));
r = sqrt((x - size(og_img, 2) / 2).^2 + (y - size(og_img, 1) / 2).^2);
petals = mod(atan2(y - size(og_img, 1) / 2, x - size(og_img, 2) / 2) + pi / 6, 2 * pi) < pi / 2;
petals = petals .* (r < size(og_img, 1) / 2) * 255;

% Set flower colors
flower_color = [255, 0, 0]; % Red color

% Apply flower colors to the image
for i = 1:3
    og_img(:, :, i) = og_img(:, :, i) + uint8(petals .* (flower_color(i) / 255));
end

% Display the image
imshow(og_img);
title('Flower Image');



