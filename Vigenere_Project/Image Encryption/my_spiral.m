% created 3/15/24 CC (referencing Matlab's 'spiral' function)
% Edited 3/15/24 CC [still working]
% Last edited 03/16/24 SP [Code works]

function spiral_indices = my_spiral(rows, cols, key_col)
% MY_SPIRAL generates spiral_indices for a matrix of size rows x cols


%=== INITIALIZE VARIABLES
% matrix to store spiral values. array size = rows*cols
spiral_indices = zeros(rows, cols);

% starting position:
r = 1;      % initialize row index
c = 1;     % initialize column index
num = 1;

%=== BEGIN FILLING spiral indices
while num <= numel(key_col)
        % Move right until either edge or filled index
        while c <= cols && spiral_indices(r, c) == 0
            spiral_indices(r, c) = key_col(num);  
            num = num + 1;
            c = c + 1; % Move right
        end
        c = c - 1;

        % Move down (col)
        r = r + 1; % move down
        while r <= rows && spiral_indices(r, c) == 0

    
    if c < cols && spiral_indices(r, c + 1) == 0
        c = c + 1; % Move right (only if able to!)
    elseif r < rows && spiral_indices(r + 1, c) == 0
        r = r + 1; % Move down (only if possible)
    elseif c > 1 && spiral_indices(r, c - 1) == 0
        c = c - 1; % Move left
    else
        r = r - 1; % Move up! Ah ha ha!
    end
end
end 

    % Move down on column
  %  r = r + 1; % Move down
   % while r <= rows && spiral_indices(r, c) == 0
        % fill current position & increment index
      %  spiral_indices(r,c) = key_col(num);   
      %  num = num+1;   
       % r = r + 1; % Move down
   % end
   % r = r - 1; % Adjust row index to avoid issues
   
    % Move left on rows
  %  c = c - 1; % Move left
  %  while c >= 1 && spiral_indices(r, c) == 0
      %  spiral_indices(r, c) = key_col(num);
   %     num = num + 1;
     %   c = c - 1; % Move left
   % end
   % c = c + 1; % Adjust column index

    % Moving up on columns
   % r = r - 1; % Move up
  %  while r >= 1 && spiral_indices(r, c) == 0
     %   spiral_indices(r, c) = key_col(num);
      %  num = num + 1;
        %r = r - 1; % Move up
   % end
 %   r = r + 1;
  %  c = c + 1;
%end

%end 



% 
% 
%         % Move right if not at the last column or next position is already filled
%         if c < cols && s(r, c + 1) == 0
%             c = c + 1; % Move right
%         elseif r < rows && s(r + 1, c) == 0 % Move down if not at the last row or next position is already filled
%             r = r + 1; % Move down
%         elseif c > 1 && s(r, c - 1) == 0 % Move left if not at the first column or next position is already filled
%             c = c - 1; % Move left
%         elseif r > 1 && s(r - 1, c) == 0 % Move up if not at the first row or next position is already filled
%             r = r - 1; % Move up
%         else
%             break; % Stop if nowhere to move
%         end
%         c = c+1;        %move right
%     end
% 
% 
% s(r, c) = 1;        % center position set to 1
% 
% 
% %=== IF MATRIX IS 1x1, RETURN
% if rows*cols == 1
%     spiral_indices = [r, c];
%     return;
% end


%===== BEGIN PATTERN =====%
%%% Wind out from center point
% 1) down col [fixed A, increasing B] 
% 2) right on row [fixed B, increasing A]
% 3) left on row [fixed A, decreasing B]
% 4) up col [decreasing A, fixed B]
% Repeat process

%=== INITIALIZE
%k = 1;      % indices
%d = 1;      % direction (increasing vs decreasing)

%for p = max(rows, cols)-1:-1:1
   % step = p;

    % Right on row (+d) or Left on row (-d)
    %for ii = 1:step
        %if r >= 1 && r <= rows && c >= 1 && c <= cols
          %  s(r, c) = k;
            %k = k + 1;
       % end
       % c = c + d; % move right (+d) or left (-d)
   % end

    % Down on column (+d) or Up on column (-d)
    %for ii = 1:step
      %  if r >= 1 && r <= rows && c >= 1 && c <= cols
           % s(r, c) = k;
            %k = k + 1;
       % end
       % r = r + d; % move down (+d) or up (-d)
   % end

   
    
    % Change direction
   % d = -d;
%
    

%end
    
% return the spiral pattern
%spiral_indices = s;

%end



%{
OLD DRAFTS
% Outer layers of spiral

% Generate spiral
for p = 1:max(rows,cols) - 1
     step = p;

    % Right on row (+d) or Left on row (-d)
    for ii = 1:step
        s(r,c) = k;
        k = k+1;
        c = c+d;    % move right (+d) or left (-d)
    end


    % Down on column (+d) or Up on column (-d)
    for ii = 1:step
        s(r,c) = k;
        k = k+1;
        r = r+d;    % move down (+d) or up (-d)
    end
    

    % Change direction
    d = -d;

    end


% Return the spiral pattern
spiral_indices = s;

end

%{
while k <= total_steps
        % Right on row
        step = step+1;
        c = c+d;    % Move right
        if r >= 1 && r <= rows && c >= 1 && c <= cols
            s(r,c) = k;     % Update matrix
            k = k + 1;      % Increment index
        end


        % Down col
        for ii = 1:step
            r = r+d;    % Move down
            if r >= 1 && r <= rows && c >= 1 && c <= cols
                s(r,c) = k;     % Update matrix
                k = k + 1;      % Increment index
            end
        end


        % Left on row
        for ii = 1:step
            c = c-d;    % Move left
            if r >= 1 && r <= rows && c >= 1 && c <= cols
                s(r,c) = k;     % Update matrix
                k = k+1;        % Increment index
            end
        end


        % Up col
        for ii = 1:step
            r = r-d;        % Move up
            if r >= 1 && r <= rows && c >= 1 && c <= cols
                s(r,c) = k;     % Update matrix
                k = k+1;        % Increment index
            end
        end
    
   
    %=== SWITCH DIRECTION for next iteration
    d = -d;

end

%=== STORE SPIRAL INDICES
spiral_indices = s;

end
%}
%}


