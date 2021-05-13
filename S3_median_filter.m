clear;
close all;

img = imread('Leopard2.jpg');
img = double(img)/255; % Natężenie koloru // zmiana na przedział 0-1
[height, width, col] = size(img);

sp_imt = img;
sp_imt(img < 0) = 0; img(img > 1) = 1; % jak ujemne to 0 jak większe od 1 to 1

img_out = zeros([height, width, col]);
[s_x,s_y]=size(sp_imt); % Zapisanie bez kolorów

for i = 2:s_x-1       
    for j = 2:s_y-1
        m = 1;
        n = 1;
        for x = i-1:i+1
            for y = j-1:j+1
                kw(m,n) = sp_imt(x,y);
                n = n + 1;
            end
            m = m + 1;
            n = 1;
        end
        % wybieranie mediany
        medianfilter = reshape(kw',9,1); 
        queue = sort(medianfilter);
        median = queue(5); % przypisanie mediany do obrazu wyjsciowego            
        img_out(i,j) = median;       
    end
end
figure(1)
imshow(sp_imt)
figure(2)
imshow(img_out)
a=immse(img_out, sp_imt)