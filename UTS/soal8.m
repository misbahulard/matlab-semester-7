clear;

N=100;
xmin=0; xmax=4; dx=xmax-xmin;
y=0; ymax=0;

for i=1:N
    x=xmin + dx * rand();
    y=exp(-x) * sin(x);
    if (y>ymax)
        ymax=y;
    end
end

fprintf('Nilai maksimal fungsi = %f\n', ymax);