function [root, ea, iter] = secant(func, xrold, xroldold, es, maxit, varargin)
    if nargin<3, error('at least 3 input arguments required'); end
    if nargin<4|isempty(es), es=0.0001; end
    if nargin<5|isempty(maxit), maxit=50; end
    iter=0;
    while(1) 
        xr = xrold - (func(xrold)*(xroldold-xrold))/(func(xroldold)-func(xrold));
        iter = iter + 1;
        fprintf("%d iteration\nxrold=%f\nxr=%f\n", iter, xrold, xr);
        if xr == xrold, break,end
        if xr~=0, ea = abs((xr-xrold)/xr)*100; end
        if ea <= es | iter >= maxit, break, end
        xroldold = xrold;
        xrold = xr;
    end
root = xr;
end
