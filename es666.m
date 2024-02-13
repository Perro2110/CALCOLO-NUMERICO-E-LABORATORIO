f=@(x) (x-(25)^(1/3))
fp=diff(sym(f))
fs=diff(sym(fp))
fplot(fs)
if abs(f(3)) <= ((3-2)*abs(1))
    disp('true sx')
end
a=2;
b=3;
maxit=1000;
tol=1e-4;
[c,it] = bisezione(a,b,tol,maxit,f)

