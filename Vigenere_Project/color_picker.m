% ALLOW USERS TO PICK COLOR
% Outputs both RGB and Hex keys to be used for encryption

function RGB_key = colorpick()

    c = uisetcolor('Choose a color to encrypt with!');

    red_channel = c(1)*255;
    green_channel = c(2)*255;
    blue_channel = c(3)*255;

    RGB_key = [red_channel, green_channel, blue_channel];
    hex_key = rgb2hex(RGB_key);


%%% Convert RGB to Hex code
function hex_key = rgb2hex(c)
    hex_key = sprintf('#%02X%02X%02X', c(1), c(2), c(3)); %format specifications
    %# first, then format each r g or b as 2 digits (leading 0's if needed,
    % %X indicates hex (base 16) conversion


disp('RGB key');
disp(RGB_key);
disp('Hex key');
disp(hex_key);

end
end
