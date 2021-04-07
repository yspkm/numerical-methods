function x =  JacobiIter(A, b, es, maxit) 
    % JacobiIter: Jacobi Iteration method
    %   x = JacobiIter (A, b): Jacobi Iteration without relaxation
    % input: 
    %   A = coefficient matrix
    %   b = right hand side vector
    %   es = stop criteria (default = 0.00001%)
    %   maxit = max iteration (default = 50)
    % output:
    %   x = solution vector

    if nargin<2, error('at least 2 input arguments required'), end
    if nargin<4 || isempty(maxit), maxit=50;end
    if nargin<3 || isempty(es), es=0.00001;end
    [m,n] = size(A);
    if m~=n, error('Matrix A must be square');end
    C = A;
    for i=1:n
        C(i,i) = 0;
        x(i) = 0;
    end
    x = x';
    for i = 1:n
        C(i,1:n) = C(i,1:n)/A(i,i);
    end
    for i = 1:n
        d(i) = b(i)/A(i,i);
    end
    iter = 0;
    while(1) 
        xold = x;
        for i = 1:n;
            x(i) = d(i) - C(i, :)*xold; % different from Gauss Seidel 
            if x(i) ~= 0
                ea(i) = abs((x(i)-xold(i))/x(i))*100;
            end
        end
        iter = iter + 1;
        if max(ea) < es || iter >= maxit, break, end
    end
end