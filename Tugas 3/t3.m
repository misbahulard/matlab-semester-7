clear;

Image = imread('surabaya.jpg');
[rows, cols, dim] = size(Image);

% save RGB channel
RED = Image(:,:,1);
GREEN = Image(:,:,2);
BLUE = Image(:,:,3);

% create RGB channel for output file
NEW_RED = Image(:,:,1);
NEW_GREEN = Image(:,:,2);
NEW_BLUE = Image(:,:,3);

N=100000;
xmin=1; xmax=rows; dx=xmax-xmin;
ymin=1; ymax=cols; dy=ymax-ymin;
R=0;

for i=1:N
    x=floor(xmin+dx*rand());
    y=floor(ymin+dy*rand());
    
    % get RGB value for comparison
    getR = RED(x, y);
    getG = GREEN(x, y);
    getB = BLUE(x, y);
    
    % set new color (BLUE) if not match
    NEW_RED(x, y) = 0;
    NEW_GREEN(x, y) = 0;
    NEW_BLUE(x, y) = 255;
    
    if(getR == 240 && getG == 228 && getB == 190)
        % set new color (RED) if match
        NEW_RED(x, y) = 255;
        NEW_GREEN(x, y) = 0;
        NEW_BLUE(x, y) = 0;
        
        R=R+1;
    end
    
end

P=R/N;
Luas=P * dx * dy;
fprintf('Luas area = %f\n', Luas);

Output = cat(3, NEW_RED, NEW_GREEN, NEW_BLUE);
imshow(Output);
