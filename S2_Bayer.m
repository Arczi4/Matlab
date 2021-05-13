clc;
clear;
close all;
img = imread('mandi.tif');

figure(1)
imshow(img);

[height, width, c] = size(img);
% inicjalizacja img_out
img_out = uint8(zeros(height,width));

img_out_m = zeros(height, width, c,'uint8');

% G B
img_out(1:2:end, 1:2:end, 2) = img(1:2:end, 1:2:end, 2);
img_out(1:2:end, 2:2:end, 3) = img(1:2:end, 2:2:end, 3);

% R G
img_out(2:2:end, 1:2:end, 1) = img(2:2:end, 1:2:end, 1);
img_out(2:2:end, 2:2:end, 2) = img(2:2:end, 2:2:end, 2);

figure(2)
imshow(img_out)

R =[ 0,  0,    0,   0,   0,   0;
     0, 0.25, 0.5, 0.5, 0.25, 0;
     0, 0.5,  1.0, 1.0, 0.5,  0;
     0, 0.5,  1.0, 1.0, 0.5,  0;
     0, 0.25, 0.5, 0.5, 0.25, 0;
     0,  0,    0,   0,   0,    0].*1/2;

G = [0, 0,    0,   0,   0,    0;
     0, 0.25, 0.5, 0.5, 0.25, 0;
     0, 0.5,  1.0, 1.0, 0.5,  0;
     0, 0.5,  1.0, 1.0, 0.5,  0;
     0, 0.25, 0.5, 0.5, 0.25, 0;
     0, 0,    0,   0,   0,    0].*1/4;

B = [0, 0,    0,   0,   0,    0;
     0, 0.25, 0.5, 0.5, 0.25, 0;
     0, 0.5,  1.0, 1.0, 0.5,  0;
     0, 0.5,  1.0, 1.0, 0.5,  0;
     0, 0.25, 0.5, 0.5, 0.25, 0;
     0, 0,    0,   0,   0,    0].*1/2;

img_out_m(:,:,1)=imfilter(img_out(:,:,1), R);
% figure(2), imshow(img_out_m); 

img_out_m(:,:,2)=imfilter(img_out(:,:,2),G);
% figure(2), imshow(img_out_m);  

img_out_m(:,:,3)=imfilter(img_out(:,:,3),B);
figure(2)
imshow(img_out_m); 