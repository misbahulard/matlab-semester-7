n=input('Lattice size = ');

%Initial state  
s=zeros(n+2,n+2);  
m=floor((n+2)/2);  
s(m,m)=1;

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
            if(st(i,j)==0)
                if((t_hidup==1)||(t_hidup==4))  
                    s(i,j)=1;
                end
            else
                if((t_hidup>5)||(t_hidup<2))
                    s(i,j)=0;
                end
            end
        end
    end
    u=255*s(2:n+1,2:n+1);
    figure(1), image(u), colormap(gray(255))  
    drawnow;
end
