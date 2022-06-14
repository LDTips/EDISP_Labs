% 20 * pi - 10 samples
% 2 * pi - 1 samples
% 4 * pi - 2 samples
x = 0:(0.2*pi):(20*pi);
figure;
title('Task3')
plot(x,sign(sin(x)));
