x1 = sin(0.24 * pi * (0:199));
x2 = sin(0.72 * pi * (200:399));
x = [x1 x2]; % Concatenate x2 to the end of x1

[X,f,n] = LCPS_swifft(x, hamming(100), 1:500);