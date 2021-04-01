function [x, fx, iter] = parabolic_Interpolation(f, x1, x2, x3, maxit, varargin)
    if nargin<4, error('at least 4 input arguments required'), end
    if nargin<5 || isempty(maxit), maxit = 50;end
    iter =0;
    while(1)
        f1 = f(x1, varargin{:}); f2 = f(x2, varargin{:}); f3 = f(x3, varargin{:});
        x4 = x2 - (((x2-x1)^2)*(f2-f3) - ((x2-x3)^2)*(f2-f1))/(2*((x2-x1)*(f2-f3)-(x2-x3)*(f2-f1)));
        f2 = f(x2, varargin{:}); f4 = f(x4, varargin{:});
        fprintf("x1:%f, x2:%f, x3:%f, x4:%f\n", x1, x2, x3, x4);
        
        if f2 < f4, xopt = x2;
        else, xopt = x4; end
        
        if xopt ~= x4 
            if x2 < x4, x3 = x4;
            else, x1 = x4; end
        else 
            if x2 < x4, x1=x2; x2 = x4;
            else, x2 = x4; x3=x2; end
        end
        
        iter=iter+1;
        if iter >= maxit, break, end
     end
     x=xopt ; fx = f(xopt, varargin{:});