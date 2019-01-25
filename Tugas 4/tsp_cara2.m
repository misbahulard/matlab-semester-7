clear
N=input('Jumlah kota = ');
maxIter=input('Max Iter = ');
 
%mengacak posisi titik
rand('state',0);
x=rand(1,N);
y=rand(1,N);
 
%Mengacak jalur dengan permutasi
jalur=randperm(N);
 
%Menghitung jarak
jarak=0;
for i=1:N-1
    d=sqrt((x(jalur(i+1))-x(jalur(i)))^2+(y(jalur(i+1))-y(jalur(i)))^2);
    jarak=jarak+d;
end
d=sqrt((x(jalur(N))-x(jalur(1)))^2+(y(jalur(N))-y(jalur(1)))^2);
jarak=jarak+d;

jalur_min=jalur; 
jarak_min=jarak;
  
for iter=1:maxIter
    %update jalur
    jalur_lama=jalur;
    k1=floor(N*rand+1);
    k2=floor(N*rand+1);
    jalur(k1)=jalur_lama(k2);
    jalur(k2)=jalur_lama(k1);
    
    %Menghitung jarak
    jarak=0;
    for i=1:N-1
    d=sqrt((x(jalur(i+1))-x(jalur(i)))^2+(y(jalur(i+1))-y(jalur(i)))^2);
    jarak=jarak+d;
    end
    d=sqrt((x(jalur(N))-x(jalur(1)))^2+(y(jalur(N))-y(jalur(1)))^2);
    jarak=jarak+d;

     if(jarak<=jarak_min)
        jarak_min=jarak;
        jalur_min=jalur;
        fprintf('Iterasi %d Jarak min = %1.5f\n',iter, jarak_min);
    end
    s(iter)=jarak_min;
end
 
fprintf('Hasil jalur optimal:\n');
for i=1:N
    fprintf('%d ',jalur_min(i));
end
fprintf('\nJarak = %f\n',jarak_min);
 
%Menggambar hasil jalur
for i=1:N
    sx(i)=x(jalur(i));
    sy(i)=y(jalur(i));
end

sx(N+1)=x(jalur(1));
sy(N+1)=y(jalur(1));
figure(1)
plot(sx,sy,'r');
hold on
plot(sx(1:N),sy(1:N),'o');
grid on
 
figure(2)
plot(s), grid
xlabel('Iterasi')
ylabel('Total jarak')
