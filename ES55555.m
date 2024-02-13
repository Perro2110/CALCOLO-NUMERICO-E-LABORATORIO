clc
clear all
clear

f=@(x) ((1/3) * exp(-7.*(x-3).^2))

n=20
nodi=n+1
N=201
a=1
b=5


figure(12)
xx=linspace(a,b,N)
yyf=f(xx)
for k=0:n 
    t=cos ( (2*[0:k]+1)/(2*(k+1)) *pi )
    z=(b-a)/2 * t+(a+b)/2
    [yy, d] = polyNewton(z(:,[1:k+1]), f(z(:,[1:k+1])), xx)
    plot(xx,yy,"r-",xx,yyf,"b-",z(:,[1:k+1]),f(z(:,[1:k+1])),"kO")
        title(sprintf("%d",k))
        xlabel("asse x")
                            ylabel("asse y")
    xlim([a b])
    ylim([-0.1 0.5])
    pause(0.2)
end

figure(13)
xx=linspace(a,b,N)
yyf=f(xx)
for k=0:n 
    [yy, d] = polyNewton(linspace(a,b,k+1'), f(linspace(a,b,k+1')), xx)
    plot(xx,yy,"r-",xx,yyf,"b-",linspace(a,b,k+1'),f(linspace(a,b,k+1)),"kO")
    
            title(sprintf("%d",k))
                    xlabel("asse x")
                    ylabel("asse y")
    xlim([a b])
    ylim([-0.1 0.5])
    pause(0.2)
end