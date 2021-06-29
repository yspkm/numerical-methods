% 학번: 2017312605 
% 이름: 김요셉 
% 과제명: HW(3/22)_2: Prob.5.5
% false position method 
function [root, Ea, ea, iter] = falpos(func, xl, xu, es, maxit, varargin)

if nargin<3, error('at least 3 input arguments required'), end

test = func(xl,varargin{:})*func(xu, varargin{:});
if test>0, error('no sign change'),end

if nargin<4|isempty(es), es=0.0001;end
if nargin<5|isempty(maxit), maxit=50;end
iter = 0; xr = xl; ea = 100;
fprintf("iter 0 means initial condition\n");
fprintf("false position, ea is %% error\n");
while(1)
    fprintf("iter:%8d    xl: %.7f    xu: %.7f    xr: %.7f    ea: %.7f\n", iter, xl, xu, xr, ea);
    xrold = xr;
    xr = xu - func(xu, varargin{:})*(xl-xu)/(func(xl, varargin{:})-func(xu, varargin{:}));
    iter = iter + 1;
    if xr ~= 0, Ea=abs(xr - xrold); ea = (Ea/abs(xr)) * 100; end
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
root = xr;
end