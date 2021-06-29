function [root, ea, iter] = newtraph(func, dfunc, xr, es, maxit, varargin)
%newtraph: Newton-Rapson root location zeroes
% [root, ea, iter] = newtraph(func, dfunc, xr, es, maxit, p1, p2, ...) :
%
    if nargin<3, error('at least 3 input arguments required'); end
    if nargin<4|isempty(es), es=0.0001; end
    if nargin<5|isempty(maxit), maxit=50; end
    iter=0; ea = 100;
    fprintf("iter 0 means initial condition\n");
    fprintf("newton-raphson, ea is %% error\n")
    while(1) 
        fprintf("iter:%8d    xi: %.7f    ea: %.7f\n", iter, xr, ea);
        xrold = xr;
        xr = xr - func(xr)/dfunc(xr);
        iter = iter + 1;
        if xr~=0, ea = abs((xr-xrold)/xr)*100; end
        if ea <= es | iter >= maxit, break, end
    end
    fprintf("iter:%8d    xi: %.7f    ea: %.7f\n", iter, xr, ea);
    root = xr;
end