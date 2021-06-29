function [xlin, ylin, tlin] = linspace_truss_PE (f, tmin, tmax, ns, varargin)
    tlin = linspace(tmin, tmax, ns);

    i = 0;
    tempx = [0, 0];
    for t = tlin
        i = i + 1;
        option = optimset('TolFun',1e-6,'TolX',1e-6);
        temp = fminsearch(@trussPE, [0,0], option, t, varargin{:});
        disp(temp);
        xlin(i) = temp(1);
        ylin(i) = temp(2);
        tlin(i) = t;
    end
end