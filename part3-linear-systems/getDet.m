function D = getDet(A)
%  getDet :  get determinant of A by Gauss elimination pivoting
%   D = getDet(A)
% input:
%   A = coefficient matrix
% output:
%   D = determinant of matrix A

[m,n] = size(A);
if m ~= n, error('Matrix A must be square'); end
b = zeros(n, 1);
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
D = (-1)^p;
for i = 1:n
    D = D * Aug(i, i);
end