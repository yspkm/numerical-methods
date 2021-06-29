function p = trussPE(x, t, la, lb, w, h, F, E, A)
    dla = sqrt((0.5*w + x(1))^2 + (h + x(2))^2) - la;
    dlb = sqrt((0.5*w - x(1))^2 + (h + x(2))^2) - lb;
    PEa = 0.5*E*A*abs(dla)*((dla/la)^2);
    PEb = 0.5*E*A*abs(dlb)*((dlb/lb)^2);
    W = F*cos(t)*(x(1)) + F*sin(t)*(x(2));
    p = (PEa + PEb - W);
end