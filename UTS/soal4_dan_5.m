clear;

a = 4;
c = 7;
m = 15;
x(1) = 3;
n=9;

for i=1:n-1
    x(i+1) = LCM(a, c, m, x(i));
end

T = array2table(x);
disp("LCM")
disp(T)

x = RESHUFFLE(n, 3, a, c, m, x);
T = array2table(x);
disp("LCM + RESHUFFLE")
disp(T);