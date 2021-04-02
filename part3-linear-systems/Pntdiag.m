function x = Pntdiag(d, e, f, g, h, r)
    % 2017312605 김요셉
    % HW(0405)_Prob. 9.16
    % Pntdiag: diagonal equation solver banded system
    % x = Pntdiag(e,f,g,r): Pentadiagonal system solver.
    % input:
    %   d = subsubdiagonal vector,      1*(n-2) 
    %   e = subdiagonal vector,         1*(n-1) 
    %   f = diagonal vector             1*n
    %   g = superdiagonal vector        1*(n-1)
    %   h = supersuperdiagonal vector   1*(n-2)
    %   r = right-hand side vector      1*n
    % output:
    %   x = solution vector
    n = length(f);
    d=[0 0 d];e=[0 e];g=[g 0];h=[h 0 0];
    % forward elimination
    for i = 1:n-2
        factor = e(i+1)/f(i);
        f(i+1) = f(i+1) - factor*g(i);
        g(i+1) = g(i+1) - factor*h(i);
        r(i+1) = r(i+1) - factor*r(i);
        factor = d(i+2)/f(i);
        e(i+2) = e(i+2) - factor*g(i);
        f(i+2) = f(i+2) - factor*h(i);
        r(i+2) = r(i+2) - factor*r(i);
    end
    factor = e(n)/f(n-1);
    f(n) = f(n) - factor*g(n-1);
    r(n) = r(n) - factor*r(n-1);
    % back substitution
    x(n) = r(n)/f(n);
    x(n-1) = (r(n-1)-g(n-1)*x(n))/f(n-1);
    for k = n-2:-1:1
        x(k) = (r(k) - g(k)*x(k+1)-h(k)*x(k+2))/f(k);
    end