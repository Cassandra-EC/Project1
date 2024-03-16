% created 3/15/24 CC (referencing Matlab's 'spiral' function)
% Last edited 3/15/24 CC [still working]

function spiral_indices = my_spiral(rows, cols)
% MY_SPIRAL generates spiral_indices for a matrix of size rows x cols


%=== INITIALIZE VARIABLES
% matrix to store spiral values
s = zeros(rows, cols);

% starting position:
A = ceil(rows/2);   % middle row
B = ceil(cols/2);   % middle column
s(A, B) = 1;        % center position set to 1


%=== IF MATRIX IS 1x1, RETURN
if rows*cols == 1
    spiral_indices = [A, B];
    return;
end


%===== BEGIN PATTERN =====%
%%% Wind out from center point
% 1) down col [fixed A, increasing B] 
% 2) right on row [fixed B, increasing A]
% 3) left on row [fixed A, decreasing B]
% 4) up col [decreasing A, fixed B]
% Repeat process

%=== INITIALIZE
k = 1;  % inidialize indices
d = 1;  % initialize direction (increasing vs decreasing)


for p = 1:min(rows,cols)
    q = 1:p;        % generate vector from 1 to p
    B = B + d*q;    % update column index
    k = k + q;      % update index
    s(A,B) = k;     % store new index in postion (A,B) of s

    % If spiral is complete, exit function
    if p == rows && p = cols
        spiral_indices = [A,B]; %store all indices
        return;
    end
end





 



% Start in the center.
s = zeros(n,n);
i = ceil(n/2);
j = ceil(n/2);
s(i,j) = 1;
if n == 1, return, end

% Wind outward from the center.  Use fixed i and increasing j,
% then fixed j and increasing i, then fixed i and decreasing j,
% then fixed j and decreasing i.  Then repeat.
k = 1;  % Numbering.
d = 1;  % Increasing or decreasing.
for p = 1:n
   q = 1:min(p,n-1);  % Note that q is a vector.
   j = j+d*q;
   k = k+q;
   s(i,j) = k;
   if (p == n), return, end
   j = j(p);
   k = k(p);
   i = i+d*q';
   k = k+q';
   s(i,j) = k;
   i = i(p);
   k = k(p);
   d = -d;
end
