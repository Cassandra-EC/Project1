function pixel_inconsistencies(image)
%key_new3 = key_to_img3(og_img, key)
%pixel_inconsistencies(key_new3)
%

    % Get image dimensions
    [height, width, ~] = size(image);
    
    % Initialize counter for inconsistent pixels
    num_inconsistent_pixels = 0;
    
    % Iterate through all pixels
    for i = 1:height
        for j = 1:width
            % Get R, G, and B values for the current pixel
            R_value = image(i, j, 1);
            G_value = image(i, j, 2);
            B_value = image(i, j, 3);
            
            % Check if R, G, and B values are different
            if ~(isequal(R_value, G_value, B_value))
                fprintf('Inconsistent pixel at position (%d, %d)\n', i, j);
                num_inconsistent_pixels = num_inconsistent_pixels + 1;
            end
        end
    end
    
    % Display total number of inconsistent pixels
    fprintf('Total number of inconsistent pixels: %d\n', num_inconsistent_pixels);



end
