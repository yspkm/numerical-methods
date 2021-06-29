% Newtint: Newton interpolating polynomial
% yint = Newtint(x, y, xx): Uses an (n - 1) - order Newton 
%   interpolating polynomial based on n data points (x, y)
%   to determine a value of the dependent variable (yint)
%   at a given value of the independent variable, xx.
% input:
%   x = independent variable
%   y = dependent variable
%   xx = value of independent variable at which
%       interpolation is calculated
% output: 
%   yint = interpolated value of dependent variable

function yint = Newtint(x, y, xx)
    % compute the finite diveded differences in the form of a 
    %   difference table
    n = length(x);
    if length(y) ~= n
        error("x and y must be same length");
    end 
    % assign dependent variables to the first column of b.
    b = zeros(n, n);
    b(:,1) = y(:); % the (:) ensures that y is a column vector.
    for j = 1:n-1
        for i = 1:n-j
            b(i, j+1) = (b(i+1, j) - b(i, j))/(x(i+j)-x(i));
        end
    end
    disp(b);
    % use the finite diveded differences to interpolate 
    xt = 1;
    yint = b(1,1);
    for j = 1:n-1
        xt = xt * (xx - x(j));
        yint = yint + b(1, j+1) * xt;
    end
end