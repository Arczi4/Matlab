img = imread('mandi.tif');
[x, y, c] = size(img);
figure(1) 
imshow(img);

% Inicjalizacja macierzy
img_out = zeros(x, y, c,'uint8');
img_out_m = zeros(x,y, c,'uint8');

% R B G B R G
img_out(1:6:end,1:6:end,1)= img(1:6:end,1:6:end,1); 
img_out(1:6:end,2:6:end,3)= img(1:6:end,2:6:end,3); 
img_out(1:6:end,3:6:end,2)= img(1:6:end,3:6:end,2); 
img_out(1:6:end,4:6:end,3)= img(1:6:end,4:6:end,3);
img_out(1:6:end,5:6:end,1)= img(1:6:end,5:6:end,1);
img_out(1:6:end,6:6:end,2)= img(1:6:end,6:6:end,2);

% G G R G G B
img_out(2:6:end,1:6:end,2)= img(2:6:end,1:6:end,2); 
img_out(2:6:end,2:6:end,2)= img(2:6:end,2:6:end,2); 
img_out(2:6:end,3:6:end,1)= img(2:6:end,3:6:end,1); 
img_out(2:6:end,4:6:end,2)= img(2:6:end,4:6:end,2);
img_out(2:6:end,5:6:end,2)= img(2:6:end,5:6:end,2);
img_out(2:6:end,6:6:end,3)= img(2:6:end,6:6:end,3);

% G G B G G R
img_out(3:6:end,1:6:end,2)= img(3:6:end,1:6:end,2); 
img_out(3:6:end,2:6:end,2)= img(3:6:end,2:6:end,2); 
img_out(3:6:end,3:6:end,3)= img(3:6:end,3:6:end,3); 
img_out(3:6:end,4:6:end,2)= img(3:6:end,4:6:end,2);
img_out(3:6:end,5:6:end,2)= img(3:6:end,5:6:end,2);
img_out(3:6:end,6:6:end,1)= img(3:6:end,6:6:end,1);

% B R G R B G
img_out(4:6:end,1:6:end,3)= img(4:6:end,1:6:end,3); 
img_out(4:6:end,2:6:end,1)= img(4:6:end,2:6:end,1); 
img_out(4:6:end,3:6:end,2)= img(4:6:end,3:6:end,2); 
img_out(4:6:end,4:6:end,1)= img(4:6:end,4:6:end,1);
img_out(4:6:end,5:6:end,3)= img(4:6:end,5:6:end,3);
img_out(4:6:end,6:6:end,2)= img(4:6:end,6:6:end,2);

% G G B G G R
img_out(5:6:end,1:6:end,2)= img(5:6:end,1:6:end,2); 
img_out(5:6:end,2:6:end,2)= img(5:6:end,2:6:end,2); 
img_out(5:6:end,3:6:end,3)= img(5:6:end,3:6:end,3); 
img_out(5:6:end,4:6:end,2)= img(5:6:end,4:6:end,2);
img_out(5:6:end,5:6:end,2)= img(5:6:end,5:6:end,2);
img_out(5:6:end,6:6:end,1)= img(5:6:end,6:6:end,1);

% G G R G G B
img_out(6:6:end,1:6:end,2)= img(6:6:end,1:6:end,2); 
img_out(6:6:end,2:6:end,2)= img(6:6:end,2:6:end,2); 
img_out(6:6:end,3:6:end,1)= img(6:6:end,3:6:end,1); 
img_out(6:6:end,4:6:end,2)= img(6:6:end,4:6:end,2);
img_out(6:6:end,5:6:end,2)= img(6:6:end,5:6:end,2);
img_out(6:6:end,6:6:end,3)= img(6:6:end,6:6:end,3);

figure(2)
imshow(img_out);

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
     0, 0,    0,   0,   0,    0].*1/5;

B = [0, 0,    0,   0,   0,    0;
     0, 0.25, 0.5, 0.5, 0.25, 0;
     0, 0.5,  1.0, 1.0, 0.5,  0;
     0, 0.5,  1.0, 1.0, 0.5,  0;
     0, 0.25, 0.5, 0.5, 0.25, 0;
     0, 0,    0,   0,   0,    0].*1/2;

img_out_m(:,:,1)=imfilter(img_out(:,:,1), R);
% figure(3), imshow(m); 
img_out_m(:,:,2)=imfilter(img_out(:,:,2),G);
% figure(3), imshow(m); 
img_out_m(:,:,3)=imfilter(img_out(:,:,3),B);
figure(3), imshow(img_out_m); 