% Task 3
L = 100; % Hamming 100
y = LCPS_getdata(1024, 1, 1/48000);
[s,w,t] = spectrogram(y, hamming(100), 0.9*L);
figure;
t_axis = 0:1024/size(s,2)/48000:1023/48000; % size(s,2) is width(s)
contour(w/(2*pi),t_axis * 1e03, abs(s)');
title('Spectrogram of sweeping signal from generator, hamming 100');
xlabel('Normalized freq.');
ylabel('Time [ms]');

% Task 4
L = 70; % Hamming 70
[s,w,t] = spectrogram(y, hamming(L), 0.9*L);
figure;
t_axis = 0:1024/size(s,2)/48000:1023/48000; % size(s,2) is width(s)
contour(w/(2*pi),t_axis * 1e03, abs(s)');
title('Spectrogram of sweeping signal from generator, hamming 70');
xlabel('Normalized freq.');
ylabel('Time [ms]');

L = 100; % Kaiser 100
[s,w,t] = spectrogram(y, kaiser(L,3), 0.9*L);
figure;
t_axis = 0:1024/size(s,2)/48000:1023/48000; % size(s,2) is width(s)
contour(w/(2*pi),t_axis * 1e03, abs(s)');
title('Spectrogram of sweeping signal from generator, Kaiser 100, beta = 3');
xlabel('Normalized freq.');
ylabel('Time [ms]');

L = 70; % Kaiser 70
[s,w,t] = spectrogram(y, kaiser(L,3), 0.9*L);
figure;
t_axis = 0:1024/size(s,2)/48000:1023/48000; % size(s,2) is width(s)
contour(w/(2*pi),t_axis * 1e03, abs(s)');
title('Spectrogram of sweeping signal from generator, Kaiser 70, beta = 3');
xlabel('Normalized freq.');
ylabel('Time [ms]');

L = 100; % Rectwin 100
[s,w,t] = spectrogram(y, rectwin(L), 0.9*L);
figure;
t_axis = 0:1024/size(s,2)/48000:1023/48000; % size(s,2) is width(s)
contour(w/(2*pi),t_axis * 1e03, abs(s)');
title('Spectrogram of sweeping signal from generator, Rectwin 100');
xlabel('Normalized freq.');
ylabel('Time [ms]');

L = 70; % Rectwin 70
[s,w,t] = spectrogram(y, rectwin(L), 0.9*L);
figure;
t_axis = 0:1024/size(s,2)/48000:1023/48000; % size(s,2) is width(s)
contour(w/(2*pi),t_axis * 1e03, abs(s)');
title('Spectrogram of sweeping signal from generator, Rectwin 70');
xlabel('Normalized freq.');
ylabel('Time [ms]');

L = 100; % Blackman 100
[s,w,t] = spectrogram(y, blackman(L), 0.9*L);
figure;
t_axis = 0:1024/size(s,2)/48000:1023/48000; % size(s,2) is width(s)
contour(w/(2*pi),t_axis * 1e03, abs(s)');
title('Spectrogram of sweeping signal from generator, Blackman 100');
xlabel('Normalized freq.');
ylabel('Time [ms]');

L = 70; % Blackman 70
[s,w,t] = spectrogram(y, blackman(L), 0.9*L);
figure;
t_axis = 0:1024/size(s,2)/48000:1023/48000; % size(s,2) is width(s)
contour(w/(2*pi),t_axis * 1e03, abs(s)');
title('Spectrogram of sweeping signal from generator, Blackman 70');
xlabel('Normalized freq.');
ylabel('Time [ms]');

% Task 5 - generator settings were changed