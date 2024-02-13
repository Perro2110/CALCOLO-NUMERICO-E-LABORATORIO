clc
clear all
clear
f = @(x) (1/pi).*exp(-pi.*(x-1).^2)

x1=[1 1.5 2 2.5 3]
y=f(x1)

xx=tabDiff(x1,y) % Controllo risultato precedente
p=polyfit(x1,y,4)



a=1
b=3

t(1)=cos(1/10 * pi)
t(2)=cos(3/10 * pi)
t(3)=cos(5/10 * pi)
t(4)=cos(7/10 * pi)
t(5)=cos(9/10 * pi)

z=(b-a)/2 * t(:)+ (a+b)/2
f(z)

clc
clear all
clear 
close all

f = @(x) (1/pi).*exp(-pi.*(x-1).^2)

n=4
nodi=n+1
a=1
b=3

fxx=linspace(a,b,201)
fyy=f(fxx);
g=@(x) x*0
figure(5);
for k=1:nodi
     x=linspace(a,b,k+1)'
     y=f(x)
     xx=linspace(a,b,201)
     [yy, d] = polyNewton(x, y, xx)
     plot(fxx,fyy,"b-",xx,yy,"r-",xx,g(xx),"k-",x,zeros(size(x)),"ko",x,y,"ro");
     pause(1)
end




