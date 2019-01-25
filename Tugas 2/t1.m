clear;
x=floor(rand(1, 100) * 10 + 20);
disp(x)
h=hist(x);
figure(1), bar(h), title('Histogram');

t=0:9;
p=h/sum(h);
figure(2), plot(t,p,'o-'), title('PDF');
grid;
axis([0 10 0 1]);
