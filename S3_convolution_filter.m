clc;
clear;

img = imread('Leopard2.jpg');
img = double(img)/255;

[width,height,c] = size(img);

totem = @(x) (abs(x) < 1/4); %prostokąt
tipi = @(x) (abs(x) < 1) .* (1 - abs(x)); %trójkąt 

win = totem(linspace(-1, 1, 4)' * linspace(-1, 1, 4)); % Okno na podstawie króego robimy, linespace dł okna

av = win/sum(win(:)); % zliczanie średniej

figure(1)
imshow(img);
figure(2)
img_out = imfilter(img, av,'replicate');
imshow(img_out);
lo=immse(img,img_out)
