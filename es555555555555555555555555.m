clc
clear
close all
clear all
%% parte teorica // es T)
a=-4.5
b=0.15
f= @(x) (cos(0.7.*pi + 2 .* x)./(exp(1.3.*x)-2))
nodi=(31/20).*[0:3]-(9/2)
f(nodi)
z0= ((b-a)/2) * (cos( (2*0+1)/(2*(3+1)) *pi)) + ((a+b)/2)
z1= ((b-a)/2) * (cos( (2*1+1)/(2*(3+1)) *pi)) + ((a+b)/2)
z2= ((b-a)/2) * (cos( (2*2+1)/(2*(3+1)) *pi)) + ((a+b)/2)
z3= ((b-a)/2) * (cos( (2*3+1)/(2*(3+1)) *pi)) + ((a+b)/2)
nodiCherb=[z0 z1 z2 z3]
f(nodiCherb)

%% parte pratica // es M)

n=30
xx=linspace(a,b,201)
figure(1)
pause()
for k=0:n
    
    nodi=linspace(a,b,k+1);
    [yy, d] = polyNewton(nodi,f(nodi), xx);
    figure(1)

    plot(xx,f(xx),"b-",xx,yy,"r-",xx,zeros(size(xx)),"k-",nodi,zeros(size(nodi)),"ko",nodi,f(nodi),"ro");
    hold on
    line([nodi;nodi],[zeros(size(nodi));f(nodi)])
    hold off
    
    xlabel("asse delle x");
    ylabel("asse y");
    title(sprintf("Polinomio interpolante di grado %g",k))
    legend("funzione",sprintf("polinomio intepolante grado %g",k),"asse y",sprintf("%g nodi",k),"nodi su interpolazione")
    pause(0.5);
end


