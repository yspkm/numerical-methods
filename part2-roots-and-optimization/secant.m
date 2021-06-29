function [root, ea, iter] = secant(func, xrold, xroldold, es, maxit, varargin)
    % [root, ea, iter] = secant(f, xi, xi-1, es, maxit, varargin)
    % next turn is xi+1
    if nargin<3, error('at least 3 input arguments required'); end
    if nargin<4|isempty(es), es=0.0001; end
    if nargin<5|isempty(maxit), maxit=50; end
    iter=0; ea = 100; xr = xrold;
    fprintf("iter 0 means initial condition\n");
    fprintf("secant method, ea is %% error\n")
    while(1) 
        fprintf("iter:%8d    xi-1: %.7f    xi: %.7f    xr: %.7f    ea: %.7f\n", iter, xroldold, xrold, xr, ea);
        xr = xrold - (func(xrold)*(xroldold-xrold))/(func(xroldold)-func(xrold));
        iter = iter + 1;
        if xr == xrold, break,end
        if xr~=0, ea = abs((xr-xrold)/xr)*100; end
        if ea <= es | iter >= maxit, break, end
        xroldold = xrold;
        xrold = xr;
    end
    fprintf("iter:%8d    xi-1: %.7f    xi: %.7f    xr: %.7f    ea: %.7f\n", iter, xroldold, xrold, xr, ea);
    root = xr;
end
