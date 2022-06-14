% Data from the task
Wp = 0.2;
Ws = 0.3;
Rp = 0.5;
Rs = 80;
n = zeros(1,4); % To know the order needed for different approx
% Butterworth:
[n(1), Wc] = buttord(Wp, Ws, Rp, Rs);
[B, A] = butter(n(1), Wc); % B, A are transfer function coeffs
fvtool(B, A, 'polezero');

% Chebyshev 1
[n(2), Wc] = cheb1ord(Wp, Ws, Rp, Rs);
[B, A] = cheby1(n(2), Rp, Wc); % B, A are transfer function coeffs
fvtool(B, A, 'polezero');

% Chebyshev 2
[n(3), Wc] = cheb2ord(Wp, Ws, Rp, Rs);
[B, A] = cheby2(n(3), Rs, Wc); % B, A are transfer function coeffs
fvtool(B, A, 'polezero');

% Cauer
[n(4), Wp] = ellipord(Wp, Ws, Rp, Rs);
[B, A] = ellip(n(4), Rp, Rs, Wp);
fvtool(B, A, 'polezero')