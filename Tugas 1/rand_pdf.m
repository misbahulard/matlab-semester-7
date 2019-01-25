clear;
counter=0;
n = 10000; % ubah nilai n = 20, 100, 500, 1000, 5000, 10000
while counter < n
    x=floor(rand(1, 1) * 10);
    if (mod(x, 2) == 0)
        val(counter+1) = x;
        counter = counter + 1;
    end
end

t = 0:n-1;
h = hist(val, t);
p = h / sum(h);
plot(t, p, 'o:'), grid;