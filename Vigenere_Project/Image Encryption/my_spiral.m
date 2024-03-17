% created 3/15/24 CC (referencing Matlab's 'spiral' function)
% Edited 3/15/24 CC [still working on it]
% Last edited 03/17/24 SP [WORKS FOR key_col input, done for grayscale]

function spiral = my_spiral(rows, cols, input)
% MY_SPIRAL generates spiral_indices for a matrix of size rows x cols
% SUMMARY: essentially a 'reshape' function, that reshapes the input to a
% desired number of rows and columns [but spiraling out from the center]

    %%% INPUTS:
        % rows = desired rows of output
        % columns = desired columns of output
        % input = some vector/matrix with the same
    
    %%% OUTPUTS: spiral array created from key, matching size of og_img

%=== INITIALIZE VARIABLES
% matrix to store spiral values. array size = rows*cols
spiral = zeros(rows, cols);


% reshape input into a column vector
column_input = input(:);

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
while num <= numel(column_input)
        % Move right until either edge or filled index
        while c <= right && spiral(r, c) == 0
            spiral(r, c) = column_input(num);  
            num = num + 1;
            c = c + 1; % Move right
        end
        c = c - 1; % adjust
        r = r + 1; % move down
        top = top + 1;

        % Move down (col)
        while r <= bottom && spiral(r, c) == 0
            % Fill position, increment num
            spiral(r, c) = column_input(num);
            num = num + 1;
            r = r + 1; % Move down
        end
        r = r - 1; % adjust
        c = c - 1; % Move left
        right = right - 1;

        % move left
        while c >= left && spiral(r, c) == 0
            spiral(r, c) = column_input(num);
            num = num + 1;
            c = c - 1; % move left
        end
        c = c + 1; % adjust
        r = r - 1; % Move up
        bottom = bottom - 1;

        % move up
        while r >= top && spiral(r, c) == 0
            spiral(r, c) = column_input(num);
            num = num + 1;
            r = r - 1; % move up
        end
        r = r + 1; % adjust row index
        c = c + 1; % adjust col index
        left = left + 1;
end


% figure;
% imagesc(spiral);
% colormap(gray);
% title('MY SPIRAL!!!');
% axis off

end

 


