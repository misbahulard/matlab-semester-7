clear;

a = 2;
c = 7;
m = 124;
x(1) = 3;
n = 10;

for i=1:(n-1)
    x(i+1) = LCM(a, c, m, x(i));
end

T = array2table(x);
disp(T)

x = RESHUFFLE(n, 3, a, c, m, x);
T = array2table(x);
disp(T);