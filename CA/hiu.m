n=input('Lattice size = ');  
pd=input('Density (probability) = ');
phiu=pd/2;

%Initial state  
s=zeros(n+2,n+2);  
for i=2:n+1
    for j=2:n+1
        r=rand;
        if(r<pd)
            s(i,j)=2;
        end
        if(r<phiu)
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
            % hiu
            t_hiu = 0;
            if (st(i-1, j-1) == 1)
                t_hiu = t_hiu + 1;
            end
            if (st(i, j-1) == 1)
                t_hiu = t_hiu + 1;
            end
            if (st(i+1, j-1) == 1)
                t_hiu = t_hiu + 1;
            end
            if (st(i+1, j) == 1)
                t_hiu = t_hiu + 1;
            end
            if (st(i+1, j+1) == 1)
                t_hiu = t_hiu + 1;
            end
            if (st(i, j+1) == 1)
                t_hiu = t_hiu + 1;
            end
            if (st(i-1, j+1) == 1)
                t_hiu = t_hiu + 1;
            end
            if (st(i-1, j) == 1)
                t_hiu = t_hiu + 1;
            end

            % ikan
            t_ikan = 0;
            if (st(i-1, j-1) == 2)
                t_ikan = t_ikan + 1;
            end
            if (st(i, j-1) == 2)
                t_ikan = t_ikan + 1;
            end
            if (st(i+1, j-1) == 2)
                t_ikan = t_ikan + 1;
            end
            if (st(i+1, j) == 2)
                t_ikan = t_ikan + 1;
            end
            if (st(i+1, j+1) == 2)
                t_ikan = t_ikan + 1;
            end
            if (st(i, j+1) == 2)
                t_ikan = t_ikan + 1;
            end
            if (st(i-1, j+1) == 2)
                t_ikan = t_ikan + 1;
            end
            if (st(i-1, j) == 2)
                t_ikan = t_ikan + 1;
            end
            
            % cek aturan
            if(st(i,j)==0)
                if(t_hiu==3)  
                    s(i,j)=1;
                    disp("[+] hiu");
                end
                if(t_ikan==3)
                    s(i,j)=2;
                    disp("[+] ikan");
                end
            else
                if(st(i,j)==1)
                   if(t_hiu==2 || t_hiu==3 && t_ikan>=1)
                       s(i,j)=1;
                       disp("[=] hiu");
                   else
                       s(i,j)=0;
                       disp("[-] hiu");
                   end
                end
                if(st(i,j)==2)
                   if(t_hiu==3)
                      s(i,j)=0; 
                      disp("[-] ikan");
                   end
                end
            end
        end
    end
    for i=2:n+1  
        for j=2:n+1
            if(s(i,j) == 0)
               u(i,j) = 0; 
            end
            if(s(i,j) == 1)
               u(i,j) = 255; 
            end
            if(s(i,j) == 2)
               u(i,j) = 70; 
            end
        end
    end
    figure(1), image(u), colormap(gray(255))
    drawnow;
end
