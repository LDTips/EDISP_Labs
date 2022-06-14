L = 100; % Hamming 100
y = LCPS_getdata(8000, 1, 1/48000);
spectrogram(y, hamming(100), 0.9*L, 100, 48e3);