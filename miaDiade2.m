function [rango,determinante,norminf] = miaDiade2(r,s)
    if ( isempty ( r ) )
        disp("r è vuota ERRORE !!")    
        return;
    end
    
    if(isempty (s))
        disp("s è vuota ERRORE !!")
        return;
    end

    r=r(:);
    s=s(:);

    diade= r*s';
    [Q,R] = qr(diade);
    Dr=diag(R);
    rango= numel( find( abs(Dr) > eps * (norm(diade,inf)) ) );
    determinante = det(Q)*det(R);
    norminf=norm(diade,inf);

    
    
end