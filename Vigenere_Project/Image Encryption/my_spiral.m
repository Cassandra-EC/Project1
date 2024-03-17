% created 3/15/24 CC (referencing Matlab's 'spiral' function)
% Edited 3/15/24 CC [still working]
% Last edited 03/17/24 SP [WORKS FOR key_col input, done for grayscale]

function spiral_indices = my_spiral(rows, cols, key_col)
% MY_SPIRAL generates spiral_indices for a matrix of size rows x cols


%=== INITIALIZE VARIABLES
% matrix to store spiral values. array size = rows*cols
spiral_indices = zeros(rows, cols);

% starting position:
r = 1;      % initialize row index
c = 1;     % initialize column index
num = 1;

% Boundaries of the spiral
top = 1;
bottom = rows;
left = 1;
right = cols;

%=== BEGIN FILLING spiral indices
while num <= numel(key_col)
        % Move right until either edge or filled index
        while c <= right && spiral_indices(r, c) == 0
            spiral_indices(r, c) = key_col(num);  
            num = num + 1;
            c = c + 1; % Move right
        end
        c = c - 1; % adjust
        r = r + 1; % move down
        top = top + 1;

        % Move down (col)
        while r <= bottom && spiral_indices(r, c) == 0
            % Fill position, increment num
            spiral_indices(r, c) = key_col(num);
            num = num + 1;
            r = r + 1; % Move down
        end
        r = r - 1; % adjust
        c = c - 1; % Move left
        right = right - 1;

        % move left
        while c >= left && spiral_indices(r, c) == 0
            spiral_indices(r, c) = key_col(num);
            num = num + 1;
            c = c - 1; % move left
        end
        c = c + 1; % adjust
        r = r - 1; % Move up
        bottom = bottom - 1;

        % move up
        while r >= top && spiral_indices(r, c) == 0
            spiral_indices(r, c) = key_col(num);
            num = num + 1;
            r = r - 1; % move up
        end
        r = r + 1; % adjust row index
        c = c + 1; % adjust col index
        left = left + 1;
end

figure;
imagesc(spiral_indices);
colormap(gray);
title('MY SPIRAL!!!');

end

 


