function [root, ea, iter] = fixedPointIter (func, xr, es, maxit, varargin)
    if nargin<2, error('at least 2 input arguments required'); end
    if nargin<3|isempty(es), es=0.0001; end
    if nargin<4|isempty(maxit), maxit=50; end
    g = @(x) func(x) + x;
    iter=0; ea = 100;
    fprintf("iter 0 means initial condition\n");
    fprintf("simple fixed position, ea is %% error\n");
    while(1) 
        fprintf("iter:%8d    xi: %.7f    ea: %.7f\n", iter, xr, ea);
        xrold = xr;
        xr = g(xrold);
        iter = iter + 1;
        if xr~=0, ea = abs((xr-xrold)/xr)*100; end
        if ea <= es | iter >= maxit, break, end
    end
    fprintf("iter:%8d    xi: %.7f    ea: %.7f\n", iter, xr, ea);
    root = xr;
end