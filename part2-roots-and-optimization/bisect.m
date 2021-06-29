function [root, fx, ea, iter] = bisect(func, xl, xu, es, maxit, varargin)
% 입력방법1: [mass fx ea iter] = bisect(@(m) fm(m, p1, p2), 40, 200) -> func입력은 m에 대한 함수로
% 입력방법2: [mass fx ea iter] = bisect(fm, 40, 200, es, maxit, p1, p2) -> func입력은 fm의 이름 자체로
% 이때, p1과 p2를 bisect에 입력해 주는 것이 varargin{:}임
% bisect: root location zeroes
%   [rrot, fx, ea, iter]=bisect(func,xl,xu,es,maxit,p1,p2,...):
%       uses bisection method to find the root of func
% input: 
%   func = name of function 
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%   p1,p2,... = additional parameters used by func
% output: 
%   root = real root
%   fx = function value at root
%   ea = approximate relative error (%)
%   iter = number of iterations

if nargin<3, error('at least 3 input arguments required'), end
test = func(xl,varargin{:})*func(xu, varargin{:});
if test>0, error('no sign change'),end
if nargin<4|isempty(es), es=0.0001;end
if nargin<5|isempty(maxit), maxit=50;end
iter = 0; xr = xl; ea = 100;
fprintf("iter 0 means initial condition\n");
fprintf("binary section, ea is %% error\n");
while(1)
    fprintf("iter:%8d    xl: %.7f    xu: %.7f    xr: %.7f    ea: %.7f\n", iter, xl, xu, xr, ea);
    xrold = xr;
    xr = (xl + xu)/2;
    iter = iter + 1;
    if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
    test = func(xl, varargin{:})*func(xr, varargin{:});
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else 
        ea = 0;
    end
    if ea <= es | iter >= maxit, break, end
end
fprintf("iter:%8d    xl: %.7f    xu: %.7f    xr: %.7f    ea: %.7f\n", iter, xl, xu, xr, ea);
root = xr; fx = func(xr, varargin{:});