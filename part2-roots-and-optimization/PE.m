function p = PE (x, ka, kb, La, Lb, F1, F2)
    Va = 0.5*ka*(sqrt((La-x(2))^2 + x(1)^2) - La)^2;
    Vb = 0.5*kb*(sqrt((Lb+x(2))^2 + x(1)^2) - Lb)^2;
    U = F1*x(1) + F2*x(2);
    p = Va + Vb - U;
end
