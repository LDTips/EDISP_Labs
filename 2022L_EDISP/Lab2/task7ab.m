fs = 1024;
dt = 1/fs;
time = 0.5;
% fs * t = 1024 * 0.5 = 512 samples
t = 0:dt:(time-dt); 
f = 8; % 8 Hz, so we should see 4 periods
x = sin(2*pi*f*t); %+ sin(2*pi*5*f*t);
x = [x, zeros(1, 512)];

% zero-padded sine, no window
y = fftshift(abs(fft(x)));
n1 = length(x);
f0 = (-n1/2:n1/2 - 1)*(fs/n1);
figure;
plot(f0, y);
title('512 samples sine zero-padded to 1024 FFT, rectangular window');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

% hamming
xhm = x.*hamming(length(x), 'periodic')';
y = fftshift(abs(fft(xhm)));
figure;
plot(f0, y, '-r');
title('512 samples sine zero-padded to 1024 FFT, hamming window');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

% blackman
xb = x.*blackman(length(x), 'periodic')';
y = fftshift(abs(fft(xb)));
figure;
plot(f0, y, '-g');
title('512 samples sine zero-padded to 1024 FFT, blackman window');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');

% kaiser
xk = x.*kaiser(length(x), 5)';
y = fftshift(abs(fft(xk)));
figure;
plot(f0, y, '-m');
title('512 samples sine zero-padded to 1024 FFT, kaiser window, beta = 5');
xlim([-100 100]);
xlabel('Frequency [Hz]');
ylabel('Amplitude');





