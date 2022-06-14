function x = sig_gen(sig_type) % Generates a signal from 2nd task
    switch sig_type
        case 'a'
            x = [ones(1, 512), zeros(1, 512)];
        case 'b'
            x = [ones(1, 64), zeros(1,64)];
            for ii = 1:7
                x = [x, [ones(1, 64), zeros(1,64)]]; % Concatenate
            end
        case 'c'
            % We sample 0.5 s of sine wave with sampling freq of 2048
            % So we get 1024 samples.
            fs = 2048;
            dt = 1/fs;
            time = 0.5;
            t = 0:dt:(time-dt);
            f = 8; % Sine wave freq is 8 hz, so we should get 4 periods
            % over our sampling time of 0.5s
            x = sin(2*pi*f*t);
        case 'd'
            fs = 2048;
            dt = 1/fs;
            time = 0.5;
            t = 0:dt:(time-15*dt); % we cut some samples from end
            f = 8;
            x = sin(2*pi*f*t);
        case 'e'
            n = 1:1024;
            x = exp(n*j*(pi/2));
        otherwise
            error('Incorrect argument. Letters a-g only!')
    end
end