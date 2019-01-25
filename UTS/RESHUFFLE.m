function res=RESHUFFLE(n, r, a, c, m, x)
    k = randperm(n);
    for i=1:r
        x(n+i)=LCM(a, c, m, x((n-1)+i));
        p=x(n+i);
        x(k(i))=p;
    end
    res = x(1:n);