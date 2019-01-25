lambda = 10; n = 3; k = 1;
for i=1:n
    k=k*i;
end
x = ((10^lambda) * (exp(-lambda)))/k;
disp(x)
