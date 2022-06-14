path = 'barrier.jpg'; % change depending on the PC and file
task2_filt; % Load filters


image_handle_RGB = imread(path);
image_handle_grey = rgb2gray(image_handle_RGB); % Convert to gray
image_handle = double(image_handle_grey); % convert from uint8 to double


% Generate noisy image. To do the 2nd subpoint of task 4, please change
% arguments in the line below
noisyImage = double(imnoise(uint8(image_handle), 'speckle')); 


% Show noisy image
figure;
colormap(gray); colorbar;
imagesc(noisyImage);
title('Noisy image, speckle');


% Show filtered images
% using lowpass 1 and 3x3 median filter
figure;
filteredImage1 = filter2(lp1, medfilt2(noisyImage, [3 3])); 
imagesc(filteredImage1);
colormap(gray); colorbar;
title('Denoised image, lp1 + 3x3 median');

% using lowpass 1 and 3x3 median filter
figure;
filteredImage2 = filter2(lp2, medfilt2(noisyImage, [3 3])); 
imagesc(filteredImage2);
colormap(gray); colorbar;
title('Denoised image, lp2 + 3x3 median');

% using lowpass 1 and 3x3 median filter
figure;
filteredImage3 = filter2(lp3, medfilt2(noisyImage, [3 3])); 
imagesc(filteredImage3);
colormap(gray); colorbar;
title('Denoised image, lp3 + 3x3 median');