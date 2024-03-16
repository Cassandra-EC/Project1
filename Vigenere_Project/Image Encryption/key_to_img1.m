% created 3/14/24 CC. Last edited 3/15/24 CC

function key_new1 = key_to_img1(key, og_img)

%%%CREATE KEY_NEW1, AN IMAGE MADE FROM 'KEY' INPUT, THAT IS THE SIZE OF OG_IMG
    % SUMMARY: characters of key (in an abbreviated ASCII code) are assigned to numeric values.
    % these are then used to form an array of the same size as original [the
    % values of numeric_k iterate through rows to do this]

    %%% INPUTS:
        % key = text input by user (vector)
        % og_img = original img input by user (array)

    %%% OUTPUTS: image created from adapted key
        % key_new1: values of key (scaled) repeat across rows (down
        % columns)

%%% KEY_NEW1 IS EQUIVALENT TO PROCESS_KEY
key_new1 = process_key(key, og_img);

%=== DISPLAY SHARED_KEY AS AN IMAGE [temporary]
colormap(gray);     %%% CHANGE IF WE DO 3 CHANNELS

% Show image; will scale to fit user's window & use values 0-255
imshow(shared_key, 'DisplayRange', [0,255], 'InitialMagnification', 'fit');

end

