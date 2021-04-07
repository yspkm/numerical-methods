function is_dia_domin = isDiaDomin(A)
    [m,n] = size(A);
    if m~=n, error('Matrix A must be square'); end
    is_dia_domin = true; C = A;

    for i=1:n, C(i,i) = 0; end

    for i=1:n
        for j=1:n
            if abs(C(i,j)) >= abs(A(i,i)), is_dia_domin = false; break; end
        end
        if ~is_dia_domin, break; end
    end

end % end of function: isDiaDomin