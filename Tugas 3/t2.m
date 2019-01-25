clear;

N=100000;
xmin=0; xmax=10; dx=xmax-xmin;
ymin=0; ymax=1; dy=ymax-ymin;
R=0;

for i=1:N
    x=xmin+dx*rand();
    y=ymin+dy*rand();
    if(y<(1-exp(-x)))
        R=R+1;
    end
end

P=R/N;
Luas=P * dx * dy;
fprintf('Luas area =%f\n', Luas);