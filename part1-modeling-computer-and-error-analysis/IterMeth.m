function [fx, ea, iter] = IterMeth(x, es, maxit)

if ( (nargin < 2) | isempty(es) ) es = 0.0001; end
if ( (nargin < 3) | isempty(maxit) ) maxit = 50; end

iter = 1; sol = 1; ea = 100;

while(1)
    solold = sol;
    sol = sol + x^iter / factorial(iter);
    iter = iter + 1;
    if sol ~= 0
        ea = abs((sol - solold) / sol) * 100;
    end
    if ea <= es | iter >= maxit, break; end
end
fx = sol;
end
