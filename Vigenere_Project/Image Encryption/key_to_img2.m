function complex_key_img = key_to_img2(key, og_img)
%%%CREATE AN IMAGE OF KEY, THAT IS THE SIZE OF OG_IMG
% Spiral the modified key word (e.g. cat -> ccaatt) out to create an image.


% xor_img + complex_key_img = encrypted_img 

[m, n] = size(og_img);

% Initialize variables
top = 1;
bottom = m;
left = 1;
right = n;
index = 1;

% Reshape numeric key to have sequential double values for each
% character -- ie, 1 2 3 becomes 1 1 2 2 3 3
key_for_spiral = [numeric_k; numeric_k];
key_for_spiral = key_for_spiral(:)';

%end

