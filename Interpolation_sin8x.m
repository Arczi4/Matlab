clear;
clc;

x = 0.00001: .1: 2*pi;
sig=sign(sin(8*x));

xq = 0.00001: 0.001: 2*pi;

% Linear
subplot(311)
interp1_lin = interp1(x, sig, xq, 'linear');
hold on;
plot(xq, sign(sin(8*xq)), 'b')
plot(x, sig, 'm o')
plot(xq, interp1_lin, 'r') 
title('Linear')
axis([0 7 -2 2])

% Cubic
subplot(312)
interp1_cub = interp1(x, sig, xq, 'cubic');
hold on;
plot(xq, sign(sin(8*xq)), 'b') % Oryginalny sygnał
plot(x, sig, 'm o') % Punkty
plot(xq, interp1_cub, 'r') 
title('Cubic')
axis([0 7 -2 2])

% Spline
subplot(313)
interp1_spline = interp1(x, sig, xq, 'spline');
hold on;
plot(xq, sign(sin(8*xq)), 'b')
plot(x, sig, 'm o')
plot(xq, interp1_spline, 'r') 
title('Spline')
axis([0 7 -2 2])
