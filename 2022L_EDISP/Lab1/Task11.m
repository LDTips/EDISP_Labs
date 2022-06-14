% Unit impulse sig
N = 32;
n = -3:(N-4);
dlt=(n==0);
figure;
title('Unit impulse');
stem(n,dlt);

% Unit step sig
ustep = (n>=0);
figure;
title('Unit step');
stem(n, ustep);

% Shifted unit impulse
dlt2 = [zeros(1,2) dlt];
dlt2 = dlt2(1:N);
figure;
title('Green - shifted unit impulse');
stem(n, dlt,'b');
hold on;
stem(n, dlt2, 'g');
hold off;
