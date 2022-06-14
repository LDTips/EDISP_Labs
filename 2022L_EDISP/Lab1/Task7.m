f = [1,3,5,9,11,21]*100;
f_s = 1000;
f_n = f/f_s;
for i = 1:6
    x = 0:2*pi/(1/f_n(i)):2*pi;
    figure;
    hold on;
    title(f_n(i));
    plot(x, sin(x), '-o');
    
end
