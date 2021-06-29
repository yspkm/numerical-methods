clear all
clc
L=0.008;Lf=0.004;Df=0.64;D=0.8;k=0.1;
a=0;b=L+Lf;  dx=0.001;n=ceil((b-a)/dx); 
x = linspace(a,b,n+1);
y(1)=100;

    
    %defining matrix
    for i=1:n
        if x(i)>=0 & x(i)<L
            rd(i)=-2;
        else 
              rd(i)=(-2-(k/Df)*dx^2);
        end
    end
    
    for i=1:n-1
        if x(i)==L+Lf
            rld(i)=2;
        else
            rld(i)=1;
        end
    end
    
    for i=1:n-1
        rud(i)=1;
    end
    
    for i=1:n
        if i==1
            f(1)=-100;
        else
            f(i)=0;
        end
    end
    lm=diag(rd,0)+diag(rld,-1)+diag(rud,1);
