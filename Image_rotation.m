clear;
clc;
img = imread('Lampart_maly.jpg'); 
[row, column, z]= size(img); 

% kat obrotu
kat = -130;

% radiany
rads = (2 * pi * kat)/360;  

% dopasowanie wymiarów obrazu obróconego
row_backgnd = ceil(row * abs(cos(rads)) + column * abs(sin(rads)));                      
column_backgnd = ceil(row * abs(sin(rads)) + column * abs(cos(rads)));                     

B = uint8(zeros([row_backgnd column_backgnd 3]));

% środek
x_midd = ceil(row/2);                                                            
y_midd = ceil(column/2);

midd_x = ceil((size(B,1))/2);
midd_y = ceil((size(B,2))/2);
for i=1:size(B,1)
    for j=1:size(B,2)                                                       

         x = (i - midd_x) * (cos(rads)) + (j - midd_y) * (sin(rads));                                       
         y = -(i - midd_x) * (sin(rads)) + (j - midd_y) * (cos(rads));
         
         x = round(x) + x_midd;
         y = round(y) + y_midd;

         if (x >= 1 && y >= 1 && x <= size(img,1) &&  y <= size(img,2)) 
              B(i,j,:) = img(x,y,:);  
         end
         
    end
end

imshow(B);
