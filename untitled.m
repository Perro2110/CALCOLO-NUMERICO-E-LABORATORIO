alfa=0
beta=1
n=0.5
h=(beta-alfa)/(n+1);
c = @(x)( x );
f = @(x)(-exp(x).*(1-x)+(16*pi^2+x).*sin(4*pi*x));
invh2=1/h^2
A=(spdiags( [-ones(n,1)*invh2, (ones(n,1)*2*invh2+c(x)), -ones(n,1)*invh2])...
    [-1 0 1],n, n);
b=sparse(n,1)*f(x)
b([1,n])=b([1,n])+[alpha;beta]*invh2;
