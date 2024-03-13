% TO ALLOW USERS TO PICK COLOR
% Assigns RGB_key to a 3 value triplet

function RGB_key = colorpick()

c = uisetcolor('Choose a color to encrypt with!');

red_channel = c(1)*255;
green_channel = c(2)*255;
blue_channel = c(3)*255;

RGB_key = [red_channel, green_channel, blue_channel];

end