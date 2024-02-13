clc
clear all
clear
a=2.7
b=4
x=sym("x")
f=@(x) (tan(1-x)-2/3)
fpv=@(x) (-tan(x - 1)^2 - 1)
fp=diff(sym(f))
fpp=diff(sym(fp))

if (abs(f(b)) <= (b-a)*abs(fpv(b))) 
    fprintf("true")
end
