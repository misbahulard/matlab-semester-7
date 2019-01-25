counter=0;
while counter < 10
    x=floor(rand(1, 1) * 100);
    if (mod(x, 2) ~= 0)
        z(counter+1) = x;
        counter = counter + 1;
    end
end

disp(z);