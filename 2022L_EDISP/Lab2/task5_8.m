clc;

% Get 1024 samples of function generator signal. fs = 48 kHz
% Sinusoidal, freq 1 kHz, amplitude 5 V
xlive = LCPS_getdata(1024, 1, 1/48000); % acquire live signal

% Plot raw live signal
figure;
plot(xlive);
title('1024 samples of 1kHz sinusoid from function gen.');
xlim([0 1025]);
xlabel('Sample no.');
ylabel('Power');

% FFT of the live signal
fft_live = fftshift(abs(fft(xlive)));
n0 = length(xlive);
f0 = (-n0/2:n0/2 - 1)*(48000/n0);
figure;
plot(f0, fft_live);
xlim([-2000 2000]);
title('FFT of 1kHz sinusoid from function gen. ');
xlabel('Frequency [Hz]');
ylabel('Power');

% Zero-padded FFT of the live signal
fft_live_padded = fftshift(abs(fft(xlive, 2^14))); % zero-padded
n1 = length(fft_live_padded);
f1 = (-n1/2:n1/2 - 1)*(48000/n1);
figure;
plot(f1, fft_live_padded);
xlim([-2000 2000]);
title('FFT of 1kHz sinusoid from function gen., zero padded to 2^{14}');
xlabel('Frequency [Hz]');
ylabel('Power');

% Compare FFTs
figure;
plot(f1, fft_live_padded, '-r');
hold on;
plot(f0, fft_live);
title('FFT comparison padded vs non-padded');
xlim([-2000 2000])
legend('zero-padded FFT', 'normal FFT');
hold off;


% Task 8 - using a window on the signal (hann)
windowed_xlive = xlive.*kaiser(length(xlive), 5);
fft_windowed = fftshift(abs(fft(windowed_xlive))); % fft from windowed live signal
n1 = length(fft_windowed);
f0 = (-n1/2:n1/2 - 1)*(48000/n1);
figure;
plot(f0, fft_windowed, '-r');
xlim([-2000 2000]);
title('FFT of 1kHz sinusoid from function gen, Kaiser window, b = 5');
xlabel('Frequency [Hz]');
ylabel('Power');

% Zero-padded and windowed
fft_windowed_padded = fftshift(abs(fft(windowed_xlive, 2^14))); % zero-padded
n1 = length(fft_windowed_padded);
f0 = (-n1/2:n1/2 - 1)*(48000/n1);
figure;
plot(f0, fft_windowed_padded, '-r');
xlim([-2000 2000]);
title('FFT of 1kHz sinusoid from function gen, Kaiser window, zero-pad, b = 5');
xlabel('Frequency [Hz]');
ylabel('Power');