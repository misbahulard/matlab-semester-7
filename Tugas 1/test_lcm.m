clear;

a = 2;
c = 7;
m = 124;
x(1) = 3;

for i=1:9
    x(i+1) = LCM(a, c, m, x(i));
end

T = array2table(x);
disp(T)
