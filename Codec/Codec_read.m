clear;
clc;

T = dctmtx(8);
invdct = @(block_struct) T' * block_struct.data * T;

img = imresize(imread('Manowce.png'), [1024 1024]);
[height, width, col] = size(img);

%% Odczyt plików: 
% Słowniki
load_data = load('data.jau', '-mat');

%% Zapis do zmiennych
dic_Y = load_data.dic_Y;
dic_Cb = load_data.dic_Cb;
dic_Cr = load_data.dic_Cr;

en_Y = load_data.en_Y;
en_Cb = load_data.en_Cb;
en_Cr = load_data.en_Cr;

%% Dekodowanie Huffmana i zmiana macierzy na rozmiar obrazu
dec_Y = reshape(huffmandeco(en_Y, dic_Y), [height, width]);
dec_Cb = reshape(huffmandeco(en_Cb, dic_Cb), [height, width]);
dec_Cr = reshape(huffmandeco(en_Cr, dic_Cr), [height, width]);


%% Odwrotna transformata cos
invC_Y = blockproc(dec_Y,[8 8],invdct);
invC_Cb = blockproc(dec_Cb,[8 8],invdct);
invC_Cr = blockproc(dec_Cr,[8 8],invdct);


%% Wynik końcowy
img_out = cat(3, invC_Y, invC_Cb, invC_Cr); 
img_out = ycbcr2rgb(img_out);
imwrite(img_out, 'po.png')

img_o = imresize(imread('po.png'), [1024 1024]);
immse(img, img_o)

figure(1)
subplot(121)
imshow(img)
subplot(122)
imshow(img_out)