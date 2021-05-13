clear;
clc;
img = double(imread('Lampart_maly.jpg'));
scale = 0.2;
src = size(img);
dst = [floor(src(1)*scale), floor(src(2)*scale), 3];

figure
imshow(uint8(img))
dstimg = zeros(dst(1), dst(2), 3);
ratio = [src(1)/dst(1), src(2)/dst(2)];

for c=1:dst(3)
    for i = 1:dst(1)
        for j = 1:dst(2)
            x = ceil(i*ratio(1));
            y = ceil(j*ratio(2));
            dstimg(i, j, c) = img(x, y, c);
        end
    end
end

figure
imshow(uint8(dstimg));

scale = 3;
src = size(img);
dst= [floor(src(1)*scale), floor(src(2)*scale), 3];
D = zeros(dst(1), dst(2), 3);
ratio = [src(1)/dst(2), src(2)/dst(2)];
for q = 1:dst(3)
    for w = 1:dst(1)
        for e = 1:dst(2)
            x = ceil(w*ratio(1));
            y = ceil (e*ratio(2));
            D(w, e, q) = img(x, y, q);
        end
    end
end
figure
imshow(uint8(D));    
