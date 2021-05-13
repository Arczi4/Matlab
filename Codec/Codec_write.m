%% Inicjalizacja
clear 
clc

img = im2double(imresize(imread('Manowce.png'), [1024 1024]));
[height, width, col] = size(img);
img_col = rgb2ycbcr(img);
Y = (img_col(:,:,1));
Cb = (img_col(:,:,2));
Cr = (img_col(:,:,3));

T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';

mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
    
%% Transformata cos
C_Y= blockproc(Y, [8 8], dct);
Ct_Y = blockproc(C_Y, [8 8], @(block_struct) mask .* block_struct.data);

C_Cb= blockproc(Cb, [8 8], dct);
Ct_Cb = blockproc(C_Cb, [8 8], @(block_struct) mask .* block_struct.data);

C_Cr= blockproc(Cr, [8 8], dct);
Ct_Cr = blockproc(C_Cr, [8 8], @(block_struct) mask .* block_struct.data);

%% Huffman
C_Y = round(Ct_Y(:), 2);
C_Cb = round(Ct_Cb(:), 2);
C_Cr = round(Ct_Cr(:), 2);

s = width * height; 
[P_Y, Sym_Y] = hist(C_Y, double(unique(C_Y)));
[P_Cb, Sym_Cb] = hist(C_Cb, double(unique(C_Cb)));
[P_Cr, Sym_Cr] = hist(C_Cr, double(unique(C_Cr)));

% Prawdopodobieństwo
P_Y = P_Y./s;
P_Cb = P_Cb./s;
P_Cr = P_Cr./s;

% Słowniki
dic_Y = huffmandict(Sym_Y, P_Y);
dic_Cb = huffmandict(Sym_Cb, P_Cb);
dic_Cr = huffmandict(Sym_Cr, P_Cr);

% Kodowanie huffmana
en_Y = huffmanenco(C_Y, dic_Y);
en_Cb = huffmanenco(C_Cb, dic_Cb);
en_Cr = huffmanenco(C_Cr, dic_Cr);

%% Zapis do pliku 
save('data.jau', 'dic_Y', 'dic_Cb', 'dic_Cr', 'en_Y', 'en_Cb', 'en_Cr', '-mat')
