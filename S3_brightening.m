clear
clc

img = uint8(imread('zdj.jpg'));
[height, width, c] = size(img);

img_out = uint8(zeros(height, width, c));

% Przyciemnianie obrazu 
for z = 1:c
    for h = 1:height
        for w = 1:width
            color = img(h, w, z); 
            k = 1;
            usave = 1;
            usave = usave * rand;
                while usave >= exp(-double(color)/16)
                    usave = usave * rand;
                    k = k + 1;
                end         
            lambda = k;
            img_out(h, w, z) = lambda;
        end
    end
end

% figure(1)
% imshow(img);

figure(2)
imshow(img_out);
title('Przyciemniony')

img_gray = rgb2gray(img_out);
edge_img_c = edge(img_gray,'Canny');
edge_img_r = edge(img_gray,'Roberts');
edge_img_p = edge(img_gray,'Prewitt');

figure(3)
subplot(131)
imshow(edge_img_c);
title('Canny')

subplot(132)
imshow(edge_img_r);
title('Roberts')

subplot(133)
imshow(edge_img_p);
title('Prewitt')
