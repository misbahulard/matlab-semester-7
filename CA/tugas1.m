n=input('Lattice size = ');  
pd=input('Density (probability) = ');

%Initial state  
s=zeros(n+2,n+2);  
for i=2:n+1
    for j=2:n+1
        r=rand;
        if(r<pd)
            s(i,j)=1;
        end
    end
end

u=255*s(2:n+1,2:n+1);
figure(1), image(u), colormap(gray(255))

%Iterasi sebanyak 100 kali  
for iter=1:100
    %Update state dengan aturan Game of Life  
    st=s;
    for i=2:n+1  
        for j=2:n+1
            t_hidup=st(i-1,j-1)+st(i-1,j)+st(i-1,j+1);  
            t_hidup=t_hidup+st(i,j-1)+st(i,j)+st(i,j+1);  
            t_hidup=t_hidup+st(i+1,j-1)+st(i+1,j)+st(i+1,j+1);  
            if(st(i,j)==1)
                if((t_hidup==2)||(t_hidup==3))  
                    s(i,j)=1;
                end
            else
                if(t_hidup==3)  
                    s(i,j)=1;
                end
            end
        end
    end
    u=255*s(2:n+1,2:n+1);
    figure(1), image(u), colormap(gray(255))  
    drawnow;
end
