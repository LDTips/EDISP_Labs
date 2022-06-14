% Very similar to task 3 script
% N, F, M same as in task3
N = 10; % Order
F = [0, 0.2, 0.6, 1]; % Sample passband and stopband from task
M = [1, 1, 0, 0]; % As in remez, firpm

b1 = fir2(N, F, M, rectwin(N+1));
b2 = fir2(N, F, M, hamming(N+1));

% Freq response 1
figure;
freqz(b1)
title('Freq response of lowpass FIR filter from fir2. Rectwin')

% Freq response 2
figure;
freqz(b2)
title('Freq response of lowpass FIR filter from fir2. Hamming')

% Change color of freqz plot
lines = findall(gcf, 'type', 'line');
lines(1).Color = 'red';
lines(2).Color = 'red';

% Impulse response  1
figure;
stem(b1);
title('Impulse response of lowpass FIR filter from fir2. Rectwin')

% Impulse response  2
figure;
stem(b2, 'r');
title('Impulse response of lowpass FIR filter from fir2. Hamming window')
