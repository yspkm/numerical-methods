function U = CholFactor(A)
% Cholesky Factorization 
% input: 
%   A = Symmetric Matrix
% output:
%   U = Upper Triangular Matrix
% A = U'U, hence L = U', where ' stands for transpose
% Pivoting is unnecessary since A is Symmetric.
[m,n] = size(A);
if m ~= n, error('Matrix A must be square'); end
if A ~= A', error('Matrix A must be symmetric'); end

U = zeros(n);
for i = 1:n
    temp = 0;
    for k = 1:i-1, temp = temp + U(k, i)^2; end
    U(i, i) = sqrt(A(i, i) - temp);
    for j = i+1:n
        temp = 0;
        for k = 1:i-1, temp = temp + U(k, i)*U(k, j); end
        U(i, j) = (A(i, j) - temp)/U(i, i);
    end
end