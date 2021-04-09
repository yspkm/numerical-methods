function [A, P] = Rearrng2DiaDomin(A)
    [m,n] = size(A);
    if m ~= n, error('Matrix A must be square'); end
    L = eye(n); 
    P = eye(n); 
    for k = 1:n-1
        % partial pivoting 
        [~, i] = max(abs(A(k, 1:n)));
        if i ~= k
            A([k,i], :) = A([i,k], :);
            P([k,i], :) = P([i,k], :);
        end
    end
end % end of function