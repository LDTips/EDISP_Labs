[x1, ~, Fs] = LCPS_getdata(1024,1,1/48000);
t = 1/48:1/48:1024/48; % In ms
x1decimated = x1(1:16:end);
tdecimated = t(1:16:end);
plot(t,x1,tdecimated,x1decimated,'-x');