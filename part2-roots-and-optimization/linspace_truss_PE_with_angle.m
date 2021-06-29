function [xlin, ylin, tlin] = linspace_truss_PE_with_angle (tmin, tmax, ns, varargin)
    tlin = linspace(tmin, tmax, ns);

    i = 0;
    tempx = [0, 0];
    for t = tlin
        i = i + 1;
        func = @(x) trussPE_with_angle(x(1), x(2), t, varargin{:});
        temp = fminsearch(func, [0,0]);
        xlin(i) = temp(1);
        ylin(i) = temp(2);
        tlin(i) = t;
end