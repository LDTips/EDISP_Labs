clc;

% Sine wave generator
fs = 1024;
dt = 1/fs;
time = 0.5;
% fs * t = 1024 * 0.5 = 512 samples
t = 0:dt:(time-dt); 
f = 8; % 8 Hz, so we should see 4 periods
x = sin(2*pi*f*t);

% plot sinusoidal signals
figure;
plot(x);
xlabel('Sample');
ylabel('Amplitude');
title('0.5s of 8 Hz sinusoidal wave');

figure;
plot([x, zeros(1,1024-512)]);
xlabel('Sample');
ylabel('Amplitude');
title('0.5s of 8 Hz sinusoidal wave, padded to 1024');

figure;
plot([x, zeros(1,2048-512)]);
xlabel('Sample');
ylabel('Amplitude');
title('0.5s of 8 Hz sinusoidal wave, padded to 2048');

% fft
fft_nopad = abs(fft(x));
fft_pad1024 = abs(fft(x, 1024));
fft_pad2048 = abs(fft(x, 2048));

% Plot ffts
figure;
plot(fft_nopad);
xlabel('Sample');
ylabel('Amplitude');
title('FFT of 512 samples sine, no padding');

figure;
plot(fft_pad1024);
xlabel('Sample');
ylabel('Amplitude');
title('FFT of 512 samples sine, padded to 1024')

figure;
plot(fft_pad2048);
xlabel('Sample');
ylabel('Amplitude');
title('FFT of 512 samples sine, padded to 2048')

% ifft
ifft_nopad = ifft(fft_nopad);
ifft_pad1024 = ifft(fft_pad1024);
ifft_pad2048 = ifft(fft_pad2048);

% plot ifft
figure;
plot(ifft_nopad, '-r');
xlabel('Sample');
ylabel('Amplitude');
title('IFFT of 512 samples sine no padding FFT');

figure;
plot(ifft_pad1024, '-r');
xlabel('Sample');
ylabel('Amplitude');
title('IFFT of 512 samples sine padded to 1024 FFT');

figure;
plot(ifft_pad2048, '-r');
xlabel('Sample');
ylabel('Amplitude');
title('IFFT of 512 samples sine padded to 2048 FFT');

% Remember to close all