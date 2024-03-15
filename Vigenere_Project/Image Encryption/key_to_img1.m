function simple_key_img = key_to_img1(key, og_img)
%%%CREATE AN IMAGE OF KEY, THAT IS THE SIZE OF OG_IMG
% Done 'simply'; iterate word throughout each row

%%% Inputs:
% key_new = key, repeated to match length of og_img
% og_img = original img input by user

%%%outputs: image created from key


%=== ACQUIRE SIZE OF KEY & OG_IMG
% (later will make image from key matching og)
length_k = length(key);
[m, n] = size(og_img);  % dimensions of og_img);

% numeric (double) version of key, accounting for desired ASCII start
numeric_k = double(key) - 32;


%=== MAKE 
%if key is larger than image, irrelevant; move on
if length_k > numel(og_img)
    disp(strcat('Are you sure you want', {' '}, key, ' as your key?'));
    % some if yes do x, if no do y

    key_new = numeric_k;
    %return; %IF WE TRIM DO HERE
    %%%%instead of trim: error message, confirm user wanted that order

% if key = size of img, move on
elseif length_k == numel(og_img)
    key_new = numeric_k;


% if size of og_img > length_k, repeat numeric_k to match
else 
    % creates a vector, length og_img, counting up from 0
    vector_og = 0:numel(og_img) - 1;
    
    % key_new = key, repeating until it's the size of img (call
    % remaining indices)
    key_new = numeric_k(mod(vector_og, length_k) + 1);
    reshape(key_new, m, n);

end


end
