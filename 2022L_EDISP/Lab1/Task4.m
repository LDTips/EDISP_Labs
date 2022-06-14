clc;

FsList = [44100, 48000, 88200, 96000, 176400, 192000];
samples = 2;
f_s = FsList(2); % Default is 48000 kHz
N = samples * f_s/1000; % 10 periods

[x1, ~, Fs] = LCPS_getdata(N,1,1/f_s);
figure;
plot(1:1:N,x1);
title('Sine wave');

pause(5); % Wait for user to change into square wave

[x1, ~, Fs] = LCPS_getdata(N,1,1/f_s);
figure;
plot(1:1:N, x1);
title('Square wave');
