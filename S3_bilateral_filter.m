clear;
close all;

img = imread('Leopard2.jpg');
img = double(img)/255;
z=imread('Leopard2.jpg');
z=double(z)/255;


% Ustawanie parametrów filtru bilateralnego
w = 3; % okno
sigma_c = 1; % standardowe odchylenie filtru 
sigma_s = 0.1;

out_img = bilateral_filter(img,w,sigma_c,sigma_s);

figure(1)
imshow(z,[])

figure(2)
imshow(out_img,[])
a = immse(out_img, z)

