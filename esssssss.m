
fname=@(x) (tan(1-x)-2/3)
fpname=@(x) (-tan(x - 1)^2 - 1)

a = 2.7; b = 4; x0 = 2.8;
tolx = 1.0e-5; tolf = 1.0e-7; maxit = 10; trace = 1;

[x , it,xk,fk ] = Mynewton ( fname , fpname , x0 , tolx , tolf , maxit,trace );

xx=linspace(a,b,1000)
plot(xx,fname(xx),"b-",xx,zeros(length(xx)),"k-",xk,zeros(length(xk)),"kO",xk,fname(xk),"rO");
title("Grafico es 6");
xlabel("asse delle x")
ylabel("asse delle y")

