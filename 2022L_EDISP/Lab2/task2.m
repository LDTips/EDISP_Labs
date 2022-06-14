clc;

a = sig_gen('a');
b = sig_gen('b');
c = sig_gen('c');
d = sig_gen('d');
e = sig_gen('e');

ffta = abs(fft(a));
fftb = abs(fft(b));
fftc = abs(fft(c));
fftd = abs(fft(d));
ffte = abs(fft(e));

% Signal graphs
tic;

figure;
plot(a);
title('Signal a');
xlabel('Sample');
ylabel('Amplitude');

figure;
plot(b);
title('Signal b');
xlabel('Sample');
ylabel('Amplitude');

figure;
plot(c);
title('Signal c');
xlabel('Sample');
ylabel('Amplitude');

figure;
plot(d);
title('Signal d');
xlabel('Sample');
ylabel('Amplitude');

figure;
plot(e);
title('Signal e');
xlabel('Sample');
ylabel('Amplitude');
disp('Signal graph generation time');

toc;

% FFT graphs
tic;

figure;
plot(ffta);
title('FFT of signal a');
xlabel('Sample');
ylabel('Amplitude');

figure;
plot(fftb);
title('FFT of signal b');
xlabel('Sample');
ylabel('Amplitude');

figure;
plot(fftc);
title('FFT of signal c');
xlabel('Sample');
ylabel('Amplitude');

figure;
plot(fftd);
title('FFT of signal d');
xlabel('Sample');
ylabel('Amplitude');

figure;
plot(ffte);
title('FFT of signal e');
xlabel('Sample');
ylabel('Amplitude');
disp('Signal fft graph generation time');
toc;

% zero crossings
counta = 0;
countb = 0;
for i = 1:1024
    if (ffta(i) == 0)
        counta = counta + 1;
    end
    if (fftb(i) == 0)
        countb = countb + 1;
    end
end