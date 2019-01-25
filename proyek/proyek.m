n = 100;
rule = 22;

width = 2 * n - 1;
ruleset = (bitget(rule, 1:8));

patt = zeros(1, width);
patt(floor((width+1)/2)) = 1;

% inisialisasi output
pattern = zeros(n, width);
pattern(1, :) = patt;

for i = 1 : n
   for x = 2 : width-1
       bits = [pattern(i, x-1), pattern(i, x), pattern(i, x+1)];
       bit = check_rule(bits, ruleset);
       pattern(i+1, x) = bit;
   end
   
   imshow(pattern);
end