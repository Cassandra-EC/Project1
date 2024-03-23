    %%% OLD!!! Created a new function called key_to_img2 (this has
    %%% been renamed to zzOLD_key_to_img2 by CC 3/15/24

function complex_key_img = key_to_img2(key, og_img)
%%%CREATE AN 'IMAGE' FROM KEY WORD; IMAGE IS THE SIZE OF OG_IMG
% Spiral the modified key word (e.g. cat -> ccaatt) out to create an image.
% xor_img + complex_key_img = encrypted_img 


%%% possible new approach: reassign key (to be repeated version of itself,
%%% cat -> ccaatt) & then call key_to_img1. Make modifications as
%%% necessary.

%%% if taking this approach, REASSIGN KEY TO ORIGINAL AT THE END OF THIS
%%% FUNC

[m, n] = size(og_img);

% Initialize variables
top = 1;
bottom = m;
left = 1;
right = n;
index = 1;

% Reshape numeric key to have sequential double values for each
% character -- ie, 1 2 3 becomes 1 1 2 2 3 3

%NOTE::::: CAN WE USE NUMERIC_K? [local to diff function]
key_for_spiral = [numeric_k; numeric_k]; %I'm not sure if we can use numeric_k
key_for_spiral = key_for_spiral(:)';

end

