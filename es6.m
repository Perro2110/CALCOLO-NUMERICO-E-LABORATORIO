clc
clear all
clear
f=@(x)(-x.*sin(4.*x-pi/3)+exp(-x.^3))
a=-1
b=1.5
x=[linspace(a,b,6)]'
y=f(x)
V=[x.^(3:-1:0)]
B=V'*V
z=V'*y
[L,flag]=chol(B,"lower");
if flag == 0
    alfa=rtrisol(L',ltrisol(L,z))
end
ff=@(k)(polyval(alfa,k))
aas  = abs(f(x)-ff(x))
rell = aas./abs(f(x))
