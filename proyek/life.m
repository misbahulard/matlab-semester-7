% Kondisi state seperti berikut: 0 = kosong; 1 = rumput; 2 = rusa; 3 = singa
% Aturan sebagai berikut:
% - Sebuah sel kosong akan menjadi rumput bila ada 3 sel tetangga rumput.
% - Sebuah sel kosong akan menjadi rusa bila ada 3 sel tetangga rusa.
% - Sebuah sel kosong akan menjadi singa bila ada 2 sel tetangga singa.
% - Sel rumput akan mati bila ada maksimal 4 rusa atau 6 rumput tetangga. 
% - Sel rusa akan tetap hidup bila ada lebih dari 1 rumput tetangga.
% - Sel singa akan tetap hidup bila ada 4 rusa tetangga

n=200;  
prumput=0.2;
prusa=prumput/2;
psinga=prusa/4;

output = zeros(n, n, 3, 'uint8');

%Initial state  
s=zeros(n+2,n+2);  
for i=2:n+1
    for j=2:n+1
        r=rand;
        if(r<prumput)
            s(i,j)=1;
        end
        if(r<prusa)
            s(i,j)=2;
        end
        if(r<psinga)
            s(i,j)=3;
        end
    end
end

for i=2:n+1  
    for j=2:n+1
        if(s(i,j) == 0)
           output(i,j,1) = 0;
           output(i,j,2) = 0;
           output(i,j,3) = 0;
        end
        if(s(i,j) == 1)
           output(i,j,1) = 59;
           output(i,j,2) = 179;
           output(i,j,3) = 0;
        end
        if(s(i,j) == 2)
           output(i,j,1) = 255;
           output(i,j,2) = 153;
           output(i,j,3) = 51;
        end
        if(s(i,j) == 3)
           output(i,j,1) = 255;
           output(i,j,2) = 225;
           output(i,j,3) = 77;
        end
    end
end
figure(1), imshow(output);

% Iterasi sebanyak 100 kali  
for iter=1:100
    %Update state dengan aturan Game of Life  
    st=s;
    for i=2:n+1  
        for j=2:n+1
            % rumput
            t_rumput = 0;
            if (st(i-1, j-1) == 1)
                t_rumput = t_rumput + 1;
            end
            if (st(i, j-1) == 1)
                t_rumput = t_rumput + 1;
            end
            if (st(i+1, j-1) == 1)
                t_rumput = t_rumput + 1;
            end
            if (st(i+1, j) == 1)
                t_rumput = t_rumput + 1;
            end
            if (st(i+1, j+1) == 1)
                t_rumput = t_rumput + 1;
            end
            if (st(i, j+1) == 1)
                t_rumput = t_rumput + 1;
            end
            if (st(i-1, j+1) == 1)
                t_rumput = t_rumput + 1;
            end
            if (st(i-1, j) == 1)
                t_rumput = t_rumput + 1;
            end

            % rusa
            t_rusa = 0;
            if (st(i-1, j-1) == 2)
                t_rusa = t_rusa + 1;
            end
            if (st(i, j-1) == 2)
                t_rusa = t_rusa + 1;
            end
            if (st(i+1, j-1) == 2)
                t_rusa = t_rusa + 1;
            end
            if (st(i+1, j) == 2)
                t_rusa = t_rusa + 1;
            end
            if (st(i+1, j+1) == 2)
                t_rusa = t_rusa + 1;
            end
            if (st(i, j+1) == 2)
                t_rusa = t_rusa + 1;
            end
            if (st(i-1, j+1) == 2)
                t_rusa = t_rusa + 1;
            end
            if (st(i-1, j) == 2)
                t_rusa = t_rusa + 1;
            end
            
            % singa
            t_singa = 0;
            if (st(i-1, j-1) == 3)
                t_singa = t_singa + 1;
            end
            if (st(i, j-1) == 3)
                t_singa = t_singa + 1;
            end
            if (st(i+1, j-1) == 3)
                t_singa = t_singa + 1;
            end
            if (st(i+1, j) == 3)
                t_singa = t_singa + 1;
            end
            if (st(i+1, j+1) == 3)
                t_singa = t_singa + 1;
            end
            if (st(i, j+1) == 3)
                t_singa = t_singa + 1;
            end
            if (st(i-1, j+1) == 3)
                t_singa = t_singa + 1;
            end
            if (st(i-1, j) == 3)
                t_singa = t_singa + 1;
            end
            
            % cek aturan
            if(st(i,j)==0)
                if(t_rumput==3)  
                    s(i,j)=1;
                    disp("[+] rumput");
                end
                if(t_rusa==3)
                    s(i,j)=2;
                    disp("[+] rusa");
                end
                if(t_singa==2)
                    s(i,j)=3;
                    disp("[+] singa");
                end
            else
                if(st(i,j)==1)
                   if(t_rusa==4 || t_rumput == 6)
                      s(i,j)=0; 
                      disp("[-] rumput");
                   end
                end
                if(st(i,j)==2)
                   if(t_rumput>=1)
                       s(i,j)=2;
                       disp("[=] rusa");
                   else
                       s(i,j)=0;
                       disp("[-] rusa");
                   end
                end
                if(st(i,j)==3)
                   if(t_rusa==4)
                      s(i,j)=3; 
                      disp("[=] singa");
                   else
                      s(i,j)=0; 
                      disp("[-] singa");
                   end
                end
            end
        end
    end
    for i=2:n+1  
        for j=2:n+1
            if(s(i,j) == 0)
               output(i,j,1) = 0;
               output(i,j,2) = 0;
               output(i,j,3) = 0;
            end
            if(s(i,j) == 1)
               output(i,j,1) = 59;
               output(i,j,2) = 179;
               output(i,j,3) = 0;
            end
            if(s(i,j) == 2)
               output(i,j,1) = 255;
               output(i,j,2) = 153;
               output(i,j,3) = 51;
            end
            if(s(i,j) == 3)
               output(i,j,1) = 255;
               output(i,j,2) = 225;
               output(i,j,3) = 77;
            end
        end
    end
    figure(1), imshow(output);
end
