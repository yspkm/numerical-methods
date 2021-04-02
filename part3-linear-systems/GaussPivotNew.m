function [x, D] = GaussPivotNew(A, b, tol)
% 2017312605 김요셉
% HW(0405)_Prob.9.17
% Gauss Pivot and Get determinant.  
% If D is below tol, then return 0.
%   [X D] = GaussPivot(A, b, tol): Gauss elimination with pivoting.
% input:
%   A = coefficient matrix
%   b = right hand side vector
%   tol = prespecified acceptable level to zero
% output:
%   X = solution vector
%   D = determinant of A /*det(A)*/
[m,n] = size(A);
if m ~= n, error('Matrix A must be square'); end
nb = n+1;
p = 0; % the number of pivoting
Aug = [A b];
%forward elimination
for k = 1:n-1
    % partial pivoting 
    [big, i] = max(abs(Aug(k:n, k)));
    ipr = i+k-1;
    if ipr ~= k
        Aug([k,ipr], :) = Aug([ipr,k], :);
        p = p + 1;
    end
    for i = k+1:n 
        factor = Aug(i, k)/Aug(k, k);
        Aug(i, k:nb) = Aug(i, k:nb) - factor*Aug(k, k:nb);
    end
end
% back substitution
x = zeros(n, 1);
x(n) = Aug(n,nb)/Aug(n,n);
for i = n-1:-1:1
    x(i) = (Aug(i,nb) - Aug(i, i+1:n)*x(i+1:n))/Aug(i,i);
end
D = (-1)^p;
for i = 1:n
    D = D * Aug(i, i);
end
if (D <= tol) 
    fprintf("Determinant is %g\n", D);
    error('The System is Singular or almost Singular');
end