function [L, U, P] = LuPivot(A)
    % 2017312605 김요셉
    % HW(0404)_Prob. 10.5
    % LU Factorization with pivoting
    [m,n] = size(A);
    if m ~= n, error('Matrix A must be square'); end
    L = eye(n); U = zeros(n); P = eye(n); 
    %forward elimination
    for k = 1:n-1
        % partial pivoting 
        [~, i] = max(abs(A(k:n, k)));
        ipr = i+k-1;
        if ipr ~= k
            A([k,ipr], :) = A([ipr,k], :);
            P([k,ipr], :) = P([ipr,k], :);
        end
        for i = k+1:n 
            factor = A(i, k)/A(k, k);
            A(i, k:n) = A(i, k:n) - factor*A(k, k:n);
            A(i, k) = factor;
        end
    end
    for i = 1:n
        for j = 1:i-1, L(i, j) = A(i, j); end
        for j = i:n, U(i, j) = A(i, j); end
end % end of function LuPivot
