fs = 1024;
dt = 1/fs;
time = 0.5;
% fs * t = 1024 * 0.5 = 512 samples
t = 0:dt:(time-dt); 
f = 8; % 8 Hz, so we should see 4 periods
x1 = sin(2*pi*f*t) + sin(2*pi*2*f*t); % Two sines with same ampl, slightly diff freq
x2 = sin(2*pi*f*t) + 5*sin(2*pi*10*f*t); % Two sines, one with a different amp and bigger freq
x1 = [x1, zeros(1,512)];
x2 = [x2, zeros(1,512)];

% no windowing
y = fftshift(abs(fft(x1)));
n1 = length(x1);
f0 = (-n1/2:n1/2 - 1)*(fs/n1);
figure;
plot(f0, y);
title('512 samples similar sines zero-padded to 1024 FFT, rectangular window');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

y = fftshift(abs(fft(x2)));
figure;
plot(f0, y);
title('512 samples differing sines zero-padded to 1024 FFT, rectangular window');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

% hamming
figure;
x1hm = x1.*hamming(length(x1), 'periodic')';
y = fftshift(abs(fft(x1hm)));
plot(f0, y, '-r');
title('512 samples similar sines zero-padded to 1024 FFT, hamming window');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

figure;
x2hm = x2.*hamming(length(x2), 'periodic')';
y = fftshift(abs(fft(x2hm)));
plot(f0, y, '-r');
title('512 samples differing sines zero-padded to 1024 FFT, hamming window');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

% blackman
figure;
x1hn = x1.*blackman(length(x1), 'periodic')';
y = fftshift(abs(fft(x1hn)));
plot(f0, y, '-g');
title('512 samples similar sines zero-padded to 1024 FFT, blackman window');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

figure;
x2hn = x2.*blackman(length(x2), 'periodic')';
y = fftshift(abs(fft(x2hn)));
plot(f0, y, '-g');
title('512 samples differing sines zero-padded to 1024 FFT, blackman window');
xlim([-100 100]);
xlabel('Frequency [Hz]');

% kaiser
figure;
x1k = x1.*kaiser(length(x1), 5)';
y = fftshift(abs(fft(x1k)));
plot(f0, y, '-b');
title('512 samples similar sines zero-padded to 1024 FFT, kaiser window, beta = 5');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

figure;
x2k = x2.*kaiser(length(x2), 5)';
y = fftshift(abs(fft(x2k)));
plot(f0, y, '-b');
title('512 samples differing sines zero-padded to 1024 FFT, kaiser window, beta = 5');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');
