N = 20; % Order
F = [0, 0.2, 0.6, 1]; % Sample passband and stopband from task
M = [1, 1, 0, 0]; % As in remez, firpm

b = firpm(N, F, M);

% Freq response
figure;
%plot(F, M);
freqz(b);
title('Freq reponse of firpm task3 lowpass FIR filter');
%xlabel('Normalized freq.');
%ylabel('dbFS'); % Probably?

% Impulse reponse
figure;
stem(b);
title('Impulse response of firpm task3 lowpass FIR filter')