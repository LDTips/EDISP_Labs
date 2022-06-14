path = 'Grohl.png'; % Real image path. Change if needed

img1 = ones(32, 16); % all white 32 x 16 px

% Show the image using imagesc:
figure;
imagesc(img1);
colorbar; 
title('img1');

IMG1 = fft2(img1); % Compute 2d fft

% Show the fft2 of the image using imagesc, with use of fftshift:
figure;
%imagesc([-8 7], [-16 15], fftshift(abs(IMG1)));
imagesc(fftshift(abs(IMG1)));
colorbar;
title('FFT2 (with fftshift) of img1');


% Chequerboard generation: (per table n 7)
M = 64;
N = 32;
MS = 2;

sqr1 = ones(MS, MS);
sqr0 = zeros(MS, MS);

img_chequer = repmat([sqr1, sqr0; sqr0, sqr1], floor(M/2/MS), floor(N/2/MS));

% Horizontal lines
strip1 = ones(MS, N);
strip0 = zeros(MS, N);

img_lines = repmat([strip1; strip0], M/2/MS, 1);


% Show the chequer image using imagesc:
figure;
imagesc(img_chequer);
colorbar; 
title('Chequerboard image');

IMG_CHEQUER = fft2(img_chequer); % Compute 2d fft

% Show the fft2 of the image using imagesc, with use of fftshift:
figure;
imagesc(fftshift(abs(IMG_CHEQUER)));
colorbar;
title('FFT2 (with fftshift) of chequerboard img');

% Show the lines using imagesc:
figure;
imagesc(img_lines);
colorbar; 
title('Lines image');

IMG_LINES = fft2(img_lines); % Compute 2d fft

% Show the fft2 of the image using imagesc, with use of fftshift:
figure;
imagesc(fftshift(abs(IMG_LINES)));
colorbar;
title('FFT2 (with fftshift) of lines img');


% Real image processing:
image_handle_RGB = imread(path);
image_handle_grey = rgb2gray(image_handle_RGB); % Convert to gray
image_handle = double(image_handle_grey); % convert from uint8 to double
% Show the real image using imagesc:
figure;
imagesc(image_handle);
colormap(gray);
colorbar;
title('Dave Grohl image greyscale');

REAL_IMAGE = fft2(image_handle);

% Show fft2 of the real image using imagesc, with use of fftshift:
img_size = size(image_handle);
figure;
imagesc(db(fftshift(abs(REAL_IMAGE)), 'power')); % Squared magnitude
c = colorbar;
c.Label.String = 'dB'; % Change the name of to color bar to indicate dB
title('Dave Grohl greyscale image fft2 with fftshift');