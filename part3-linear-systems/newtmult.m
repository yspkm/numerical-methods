function [x f ea iter] = newtmul(func,x0,es,maxit,varargin)
    % newtmul: Newton-Rapson root zeroes nonlinear systems
    % [x, f, ea, iter] = newtmult(func,x0,es,maxit,p1,p2,...):
    %   uses the Newton-Rapson method to find the roots of 
    %   a system of nonlinear equations
    %  input:
    %   func = name of function that returns f and J
    %   x0 = initial guess
    %   es = desired percent relative error (default = 0.0001%)
    %   maxit = maximum allowable iterations (default = 50)
    %   p1, p2, ... = additional parameters used by function 
    %  output:
    %   x = vector of roots
    %   f = vector of functions evaluated at roots
    %   ea = approximate percent relative error (%)
    %   iter = number of iterations
    % how to calculate Jacobian?
    % syms x1 x2 ...
    % x = [x1; x2; ...];
    % f = [f1; f2; ...];
    % x_value = [x1_value; x2_value; ...];
    % temp = subs(jacobian(f, x), x, x_value);
    % for i=1:n
    %   for j=1:n
    %       J(i,j) = temp(i,j);
    %   end
    % end
    % Cf. gradient(scalar_f, x_vector) will make gradient vector
    
    if nargin<2, error('at least 2 input arguments required'), end
    if nargin<3|isempty(es), es=0.0001;end
    if nargin<4|isempty(maxit), maxit=50;end
    iter = 0;
    x = x0;
    while(1)
        [J,f] = func(x,varargin{:});
        dx=J\f;
        x=x-dx;
        iter = iter + 1;
        ea = 100*max(abs(dx./x));
        if iter>=maxit|ea<=es, break, end
    end
end