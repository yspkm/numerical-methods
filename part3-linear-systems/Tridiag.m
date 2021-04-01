function x = Tridiag(e,f,g,r)
    % Tridiag: Tridiagonal equation solver banded system
    % x = Tridiag(e,f,g,r): Tridiagonal system solver.
    % input:
    %   e = subdiagonal vector,     1*(n-1) 
    %   f = diagonal vector         1*n
    %   g = superdiagonal vector    1*(n-1)
    %   r = right hand side vector  1*n
    % output:
    %   x = solution vector
    n = length(f);
    % forward elimination
    for k = 1:n-1
        factor = e(k)/f(k);
        f(k+1) = f(k+1) - factor*g(k);
        r(k+1) = r(k+1) - factor*r(k);
    end
    % back substitution
    x(n) = r(n)/f(n);
    for k = n-1:-1:1
        x(k) = (r(k) - g(k)*x(k+1))/f(k);
    end