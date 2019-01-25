clear
% Nilai pembangkitan
% dan state awal
a=2; c=7; m=10; r(1)=2;

% membangkitkan 9 bil acak
% state awal dianggap 1 bil  
for i=1:9  
    r(i+1)=LCM2(r(i));
end

disp('Sebelum resuffle:')  
disp(r)

% resuffle 3 kali  
for i=1:3
    r(10+i)=mod(a*r(9+i)+c,m);  
    p=r(10+i);
    r(p+1)=p;  
end

disp('Sesudah resuffle:')
disp(r)
