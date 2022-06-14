% For task 2, change 0.2 in filt_poles to 0.8. Also - change plot titles
% Filter coeffs
filt_poles = poly([0.9 * exp(0.8*1j*pi), 0.9 * exp(-0.8*1j*pi)]);
filt_zeros = poly(0);

dlt = [1, zeros(1,63)];

% Impulse response
figure;
plot(filter(filt_zeros, filt_poles, dlt));
grid on;
title('Impulse response of Task 2 IIR filter');

% Freq. response
figure;
freqz(filt_zeros, filt_poles, 64);
title('Freq response of Task 2 IIR filter');

% Grp. delay
figure;
grpdelay(filt_zeros, filt_poles);
title('Group delay of Task 2 IIR filter');

% 3 different sines into the filter
x = 0:63;

signals = [sin(0.4 * pi * x); sin(0.6 * pi * x); sin(0.7 * pi * x); sin(0.8 * pi * x)];

% Show all on one plot
figure;
hold on;
grid on;
title('Filtered sinusoidal signals using Task 2 IIR filter')
plot(filter(filt_zeros, filt_poles, signals(1, :)));
plot(filter(filt_zeros, filt_poles, signals(2, :)));
plot(filter(filt_zeros, filt_poles, signals(3, :)));
plot(filter(filt_zeros, filt_poles, signals(4, :)));
legend('Sin fn = 0.4', 'Sin fn = 0.6', 'Sin fn = 0.7', 'Sin fn = 0.8');