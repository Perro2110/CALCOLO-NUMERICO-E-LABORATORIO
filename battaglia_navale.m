clc 
clear all
f = @(x) (cos(x.^2+2) + rand(size(x))/30)
a= 0;
b= 2;
x = (a:0.1:b)
y = f(x)

yi=diff(y)

xx= (linspace(a,b,100))'
yy=f(xx)


YY = mySplineCompleta(x, y, yi(1), yi(end))
YYm = valSpline(YY,x,xx)

Ybello = spline(x,y)
Ybellom = ppval(Ybello,xx)

hold on
subplot(1,4,1);
plot(xx,YYm)
subplot(1,4,2);
plot(xx,Ybellom)
subplot(1,4,3);
plot(xx,yy)
subplot(1,4,4)
plot(xx,YYm,xx,Ybellom,xx,yy)
hold off
