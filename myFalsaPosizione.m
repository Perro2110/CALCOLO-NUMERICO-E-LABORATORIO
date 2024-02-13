% Matricola
function [ ck , it ] = myFalsaPosizione ( fname , a , b , tol , maxit )
    it = 0;
    fa = feval ( fname , a ) ;
    fb = feval ( fname , b ) ; 

    while(not((abs(b-a)<tol)||(it==maxit)))
        it=it+1;
        ck=b-( (fb)/(fb-fa))*(b-a);
        fck=feval(fname,ck);
        if(abs(fck)<tol)
            break;
        end
        if fck*fa<0
            a=ck;fa=fck;
        else
            b=ck;fb=fck;
        end
    end
end