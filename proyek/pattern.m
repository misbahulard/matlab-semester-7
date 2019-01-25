n=input('Width = ');

%Initial state  
s=zeros(n+2,n+2);  
m=floor((n+2)/2);  
s(m,m)=1;

output = zeros(n, n, 3, 'uint8');

for i=2:n+1  
    for j=2:n+1
        if(s(i,j) == 0)
           output(i,j,1) = 0;
           output(i,j,2) = 0;
           output(i,j,3) = 0;
        end
        if(s(i,j) == 1)
           output(i,j,1) = 233;
           output(i,j,2) = 0;
           output(i,j,3) = 71;
        end
        if(s(i,j) == 2)
           output(i,j,1) = 0;
           output(i,j,2) = 189;
           output(i,j,3) = 108;
        end
        if(s(i,j) == 3)
           output(i,j,1) = 255;
           output(i,j,2) = 219;
           output(i,j,3) = 0;
        end
    end
end
figure(1), imshow(output);

%Iterasi sebanyak 100 kali  
for iter=1:100
    %Update state dengan aturan Game of Life  
    st=s;
    for i=2:n+1
        for j=2:n+1 
            % rumput
            t_tetangga = 0;
            if (st(i-1, j-1) == 1)
                t_tetangga = t_tetangga + 1;
            end
            if (st(i, j-1) == 1)
                t_tetangga = t_tetangga + 1;
            end
            if (st(i+1, j-1) == 1)
                t_tetangga = t_tetangga + 1;
            end
            if (st(i+1, j) == 1)
                t_tetangga = t_tetangga + 1;
            end
            if (st(i+1, j+1) == 1)
                t_tetangga = t_tetangga + 1;
            end
            if (st(i, j+1) == 1)
                t_tetangga = t_tetangga + 1;
            end
            if (st(i-1, j+1) == 1)
                t_tetangga = t_tetangga + 1;
            end
            if (st(i-1, j) == 1)
                t_tetangga = t_tetangga + 1;
            end
            
            if(st(i,j)==0)
                if((t_tetangga==1))
                    s(i,j)=1;
                end
                if((t_tetangga==2))
                    s(i,j)=2;
                end
                if((t_tetangga==3))
                    s(i,j)=3;
                end
            else
                if((t_tetangga>4))
                    s(i,j)=0;
                end
            end
        end
    end
    
    % print
    for i=2:n+1  
        for j=2:n+1
            if(s(i,j) == 0)
               output(i,j,1) = 0;
               output(i,j,2) = 0;
               output(i,j,3) = 0;
            end
            if(s(i,j) == 1)
               output(i,j,1) = 233;
               output(i,j,2) = 0;
               output(i,j,3) = 71;
            end
            if(s(i,j) == 2)
               output(i,j,1) = 0;
               output(i,j,2) = 189;
               output(i,j,3) = 108;
            end
            if(s(i,j) == 3)
               output(i,j,1) = 255;
               output(i,j,2) = 219;
               output(i,j,3) = 0;
            end
        end
    end
    figure(1), imshow(output);
end
