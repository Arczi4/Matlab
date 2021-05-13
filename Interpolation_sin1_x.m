clear;
clc;

xq = 0.00001: 0.01: 2*pi;
x = 0.00001: .1: 2*pi;
sig = sin(x.^(-1));

% Linear
subplot(311)
interp1_lin = interp1(x, sig, xq, 'linear');
hold on;
plot(xq, sin(1./xq), 'b') % Podstawowy sygnał
plot(x, sig, 'm o') % Punkty
plot(xq, interp1_lin, 'r') % Interpolacja
title('Linear')

% Cubic
subplot(312)
interp1_cub = interp1(x, sig, xq, 'cubic');
hold on;
plot(xq, sin(1./xq), 'b') % Podstawowy sygnał
plot(x, sig, 'm o') % Punkty
plot(xq, interp1_cub, 'r') % Interpolacja
title('Cubic')

% Spline
subplot(313)
interp1_spline = interp1(x, sig, xq, 'spline');
hold on;
plot(xq, sin(1./xq), 'b') % Podstawowy sygnał
plot(x, sig, 'm o') % Punkty
plot(xq, interp1_spline, 'r') % Interpolacja
title('Spline')
  