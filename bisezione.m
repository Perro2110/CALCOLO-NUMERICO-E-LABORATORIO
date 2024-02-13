function [c,it] = bisezione(a,b,tol,maxit,f)
    it=-1;
    while(not((abs(b-a)<tol))||(it==maxit))
        it=it+1;
        c=(b+a)/2;
        if(abs(feval(f,c))<tol)
            break;
        end
        if(sign(feval(f,a))*sign(feval(f,c))<0)
            b=c;
        else
            a=c;
        end
    end
end
