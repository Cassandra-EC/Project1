%%% CHECK SIZE OF UI uploaded img, to see if it can be processed

function [img_size, size_lim] = size_check(img, image_preference, img_path)

    % Check size of image
    if strcmp(image_preference, 'Upload image from file') % File upload
        img_info = imfinfo(img_path);
        img_size = img_info.FileSize; % FileSize built into imfinfo
        size_lim = 24000;
    elseif strcmp(image_preference, 'Provide image URL') % URL upload
        img_size = numel(img); % Estimate from array size
        size_lim = 740000;
    elseif strcmp(image_preference, 'Create image array')
        img_size = size(img);
        size_lim = 743000;
    else
        error('Invalid option selected.');
    end

    % Display img_size and size_lim for verification
    disp(['Image Size: ', num2str(img_size)]);
    disp(['Size Limit: ', num2str(size_lim)]);

end

