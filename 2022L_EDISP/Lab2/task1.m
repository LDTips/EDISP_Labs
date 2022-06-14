clc

fs = [1e06, 1e04, 1e04]; % Sampling freq.
T = [2,2,4]*1e-03; % Sampling duration
% Total sig. length - 4 ms

N = fs.*T; % Sample count
N1 = fs.*1e-03; % Non-zero samples

x1 = [ones(1, N1(1)), zeros(1, N(1) - N1(1))];
x2 = [ones(1, N1(2)), zeros(1, N(2) - N1(2))];
x3 = [ones(1, N1(3)), zeros(1, N(3) - N1(3))];

fft1 = abs(fft(x1));
fft2 = abs(fft(x2));
fft3 = abs(fft(x3));

% Finding k_null in fft of 1st sig
i = 1;
while 1
    if fft1(i) == 0
        k_null(1) = i - 1;
        break;
    end
    i = i + 1;
end

% Finding k_null in fft of 2nd sig
i = 1;
while 1
    if fft2(i) == 0
        k_null(2) = i - 1;
        break;
    end
    i = i + 1;
end

% Finding k_null in fft of 3rd sig
i = 1;
while 1
    if fft3(i) == 0
        k_null(3) = i - 1;
        break;
    end
    i = i + 1;
end
clearvars i;
% Plot the fft's
figure;
plot(abs(fft1), '-b');
title('fft of sig 1');
figure;
plot(abs(fft2), '-g');
title('fft of sig 2');
figure;
plot(abs(fft3), '-r');
title('fft of sig 3');