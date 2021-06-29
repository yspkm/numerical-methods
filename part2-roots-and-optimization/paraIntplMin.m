function [xopt, fopt, ea, iter] = paraIntplMinNew(f, x1, x2, x3, maxit, es, varargin)
    % it works!
    if nargin<4, error('at least 4 input arguments required'), end
    if nargin<5 || isempty(maxit), maxit = 50;end
    if nargin<6 || isempty(es), es = 0.00001;end
    iter = 0;
    f1 = f(x1, varargin{:}); f2 = f(x2, varargin{:}); f3 = f(x3, varargin{:});
    xopt = x2; x4 = x2; f4 = f2; ea = 100;
    func = @(x) f(x, varargin{:});
    fprintf("iter 0 means initial condition\n");
    fprintf("parabolic interpolation minimum search, ea is %% error\n")
    while(1)
        xopt_old = xopt;
        fopt = func(xopt);
        fprintf("iter:%8d    x1: %.7f   x2: %.7f  x3: %.7f    x4: %.7f    (xopt = %.7f)    ea: %.7f\n", iter, x1, x2, x3, x4, xopt, ea);
        fprintf("iter:%8d    fl: %.7f   f2: %.7f  f3: %.7f    f4: %.7f    (fopt = %.7f)    ea: %.7f\n\n", iter, f1, f2, f3, f4, fopt, ea);
        iter = iter+1;
        x4 = x2 - ((((x2-x1)^2)*(f2-f3) - ((x2-x3)^2)*(f2-f1))/(2*((x2-x1)*(f2-f3)-(x2-x3)*(f2-f1))));
        f4 = f(x4, varargin{:});
        xopt = x4;
        if f4 < f2
            xopt = x4;
            fopt = f4;
            if x2 < x4
                x1 = x2; x2 = x4; 
                f1 = f2; f2 = f4;
            else 
                x3 = x2; x2 = x4;
                f3 = f2; f2 = f4;
            end
        else 
            xopt = x2;
            fopt = f2;
            if x2 < x4 
                x3 = x4;
                f3 = f4;
            else 
                x1 = x4;
                f1 = f4;
            end
        end
        if xopt ~= 0, ea = abs((xopt - xopt_old)/xopt)*100; end
        if iter >= maxit || ea < es, break, end
        if x1 == x2 || x3 == x2, break, end % convergence
    end
    fprintf("iter:%8d    x1: %.7f   x2: %.7f  x3: %.7f    x4: %.7f    (xopt = %.7f)    ea: %.7f\n", iter, x1, x2, x3, x4, xopt, ea);
    fprintf("iter:%8d    fl: %.7f   f2: %.7f  f3: %.7f    f4: %.7f    (fopt = %.7f)    ea: %.7f\n\n", iter, f1, f2, f3, f4, fopt, ea)
end