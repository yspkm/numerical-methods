function [x, fx, ea, iter] = goldmin(f, xl, xu, es, maxit, varargin)
% [x, fx, ea, iter] goldmin(f, xl, xu, es, maxit, p1, p2, ...):
%   uses golden section search to find the minimum of f
% input: 
%   f = name of function 
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%   p1, p2, ... = additional parameters used by f
% output:
%   x = location of minimum
%   fx = minimum function value
%   ea = approximate realtive error (%)
%   iter = number of iterations

if nargin<3, error('at least 3 input arguments required'), end
if nargin<4|isempty(es), es=0.0001;end
if nargin<5|isempty(maxit), maxit = 50;end
phi = (1+sqrt(5))/2; iter = 0;
d = (phi-1)*(xu-xl);

x1 = xl + d; x2 = xu - d;
xopt = 100;
f1 = f(x1, varargin{:}); f2 = f(x2, varargin{:});
func = @(x) f(x, varargin{:});
fopt = 100;
fprintf("iter 0 means initial condition\n");
fprintf("golden section minimum search, ea is %% error\n");
ea = 100;
while(1)
    fprintf("iter:%8d    xl: %.7f   x2: %.7f  x1: %.7f    (xopt = %.7f)    xu: %.7f    ea: %.7f\n", iter, xl, x2, x1, xopt, xu, ea);
    fprintf("iter:%8d    fl: %.7f   f2: %.7f  f1: %.7f    (fopt = %.7f)    fu: %.7f    ea: %.7f\n\n", iter, func(xl), f2, f1, func(xopt), func(xu), ea);
    xint = xu - xl;
    if f1 < f2
        xopt = x1; xl = x2; x2 = x1; f2 = f1;
        x1 = xl + (phi-1)*(xu-xl); f1 = f(x1, varargin{:});
    else 
        xopt = x2; xu = x1; x1 = x2; f1 = f2;
        x2 = xu - (phi-1)*(xu-xl); f2 = f(x2, varargin{:});
    end
    iter=iter+1;
    if xopt~=0, ea = (2 - phi) * abs(xint/xopt) * 100; end
    if ea <= es | iter >= maxit, break, end
    fopt = func(xopt);
 end
 fprintf("iter:%8d    xl: %.7f   x2: %.7f  x1: %.7f    (xopt = %.7f)    xu: %.7f    ea: %.7f\n", iter, xl, x2, x1, xopt, xu, ea);
 fprintf("iter:%8d    fl: %.7f   f2: %.7f  f1: %.7f    (fopt = %.7f)    fu: %.7f    ea: %.7f\n\n", iter, func(xl), f2, f1, func(xopt), func(xu), ea)
 x=xopt ; fx = f(xopt, varargin{:});
