clear;
x=rand(1,100);  
y=((3*x/2).^(1/3));
disp(y);
h=hist(x,10);
figure(1), bar(h), title('Histogram');

t=0.1:0.1:1;
p=h/sum(h);
figure(2), plot(t,p,'o-'), title('PDF'), grid  
axis([0 1 0 0.2])
