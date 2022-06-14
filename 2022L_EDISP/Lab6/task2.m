path = 'barrier.jpg'; % Real image path. Change if needed
task2_filt; % Load the filters

% Handle real life image
image_handle_RGB = imread(path);
image_handle_grey = rgb2gray(image_handle_RGB); % Convert to gray
image_handle = double(image_handle_grey); % convert from uint8 to double

% Per table 6.2
lp = lp4;
hp = hp1;
edg = edg7;

% Low-pass
filtered_lp = filter2(lp, image_handle);
figure;
imagesc(filtered_lp);
colormap(gray);
colorbar;
title('Image greyscale filtered - lowpass filter 3');

% High-pass
filtered_hp = filter2(hp, image_handle);
figure;
imagesc(filtered_hp);
colormap(gray);
colorbar;
title('Image greyscale filtered - highpass filter 1');

% Edge filter
filtered_edg = filter2(edg, image_handle);
figure;
imagesc(filtered_edg);
colormap(gray);
colorbar;
title('Image greyscale filtered - edge filter 7');

% Display max and min values:
fprintf('Min and max for low-pass: %d , %d\n', min(min(filtered_lp)), max(max(filtered_lp)));
fprintf('Min and max for high-pass: %d , %d\n', min(min(filtered_hp)), max(max(filtered_hp)));
fprintf('Min and max for edge: %d , %d\n', min(min(filtered_edg)), max(max(filtered_edg)));
% disp('Low-pass filter min and max:');
% disp(min(min(filtered_lp))); 
% disp(max(max(filtered_lp)));
% disp('High-pass filter min and max:');
% disp(min(min(filtered_hp))); 
% disp(max(max(filtered_hp)));
% disp('Edge filter min and max:');
% disp(min(min(filtered_edg))); 
% disp(max(max(filtered_edg)));

% freqz2(h) is executed in console

% Compute 2d ffts
REAL_IMAGE_LP = fft2(filtered_lp);
REAL_IMAGE_HP = fft2(filtered_hp);
REAL_IMAGE_EDGE = fft2(filtered_edg);

% Show the fft2 of the image using imagesc, with use of fftshift
% Low pass
img_size = size(image_handle);
figure;
imagesc(db(fftshift(abs(REAL_IMAGE_LP)), 'power'));
colorbar;
title('FFT2 (with fftshift) of lp filtered image');

% High pass
figure;
imagesc(db(fftshift(abs(REAL_IMAGE_HP)), 'power'));
colorbar;
title('FFT2 (with fftshift) of hp filtered image');

% Edge
figure;
imagesc(db(fftshift(abs(REAL_IMAGE_EDGE)), 'power'));
colorbar;
title('FFT2 (with fftshift) of edge filtered image');
