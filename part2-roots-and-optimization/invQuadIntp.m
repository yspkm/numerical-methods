function [root, ea, iter] = invQuadIntp(f, x1, x2, x3, maxit, es)
    % it works!
    if nargin<4, error('at least 4 input arguments required'), end
    if nargin<5 || isempty(maxit), maxit = 50;end
    if nargin<6 || isempty(es), es = 0.00001;end
    y1 = f(x1); y2 = f(x2); y3 = f(x3);
    iter = 0; ea = 100;
    fprintf("iter 0 means initial condition\n");
    fprintf("inverse Quadratic interpolation, ea is %% error\n");
    fprintf("ragrange polynomial with y = 0, then g(x) = x = ~ GGol\n");
    fprintf("y1 y2 y3 three all diff, ifnot, error\n");
    while(1)
        fprintf("iter:%8d    x1: %.7f   x2: %.7f  x3: %.7f    ea: %.7f\n", iter, x1, x2, x3,ea);
        fprintf("iter:%8d    yl: %.7f   y2: %.7f  y3: %.7f    ea: %.7f\n\n", iter, y1, y2, y3, ea);
        x = ((y2*y3)/((y1-y2)*(y1-y3)))*x1 + ((y1*y3)/((y2-y1)*(y2-y3)))*x2 + ((y1*y2)/((y3-y1)*(y3-y2)))*x3;
        if x ~= 0, ea = abs((x - x3)/(x))*100; end
        if (iter >= maxit || ea < es) break; end
        y1 = y2; y2 = y3; y3 = f(x); 
        x1 = x2; x2 = x3; x3 = x;
        iter = iter + 1;
        end
    ea = ea;
    root = x;
    fprintf("iter:%8d    x1: %.7f   x2: %.7f  x3: %.7f    ea: %.7f\n", iter, x1, x2, x3 ,ea);
    fprintf("iter:%8d    yl: %.7f   y2: %.7f  y3: %.7f    ea: %.7f\n\n", iter, y1, y2, y3, ea);
end
