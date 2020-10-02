function M = pintar(iniciov,finv,inicioh,finh,M,p,color)
    for i=iniciov*p+1:finv*p
        for j=inicioh*p+1:finh*p
        M(i,j)=color;
        end
    end
end