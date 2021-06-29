function [root, ea, iter] = mdfscnt(func, xr, dx, es, maxit, varargin)
    % 입력방법: [root, ea, iter] = mdfscnt(f, xr, dx, es, maxit, varargin)
    if nargin<3, error('at least 3 input arguments required'); end
    if nargin<4|isempty(es), es=0.0001; end
    if nargin<5|isempty(maxit), maxit=50; end
    iter=0; ea = 100;
    fprintf("iter 0 means initial condition\n");
    fprintf("modefied secant, ea is %% error\n")
    while(1) 
        fprintf("iter:%8d    xi: %.7f    ea: %.7f\n", iter, xr, ea);
        xrold = xr;
        xr = xrold - (func(xr)*(dx))/(func(xr+dx)-func(xr));
        iter = iter + 1;
        if xr~=0, ea = abs((xr-xrold)/xr)*100; end
        if ea <= es | iter >= maxit, break, end
    end
    fprintf("iter:%8d    xi: %.7f    ea: %.7f\n", iter, xr, ea);
    root = xr;
end