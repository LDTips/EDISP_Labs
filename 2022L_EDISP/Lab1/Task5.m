clc;
N = 2 * 48000/1000; % 2 periods
[x1, ~, Fs] = LCPS_getdata(N,1,1/48000);
x = 1/48:1/48:N/48; % In ms
figure;
hold on;
xlabel('ms');
plot(x,x1, '-o');
title('Sine wave');
hold off;