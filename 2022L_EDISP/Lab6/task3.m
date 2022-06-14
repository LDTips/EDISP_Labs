path = 'barrier.jpg'; % change depending on the PC and file
task2_filt; % Load filters


% Load image
image_handle_RGB = imread(path);
image_handle_grey = rgb2gray(image_handle_RGB); % Convert to gray
image_handle = double(image_handle_grey); % convert from uint8 to double


% Display unfiltered image
figure;
imagesc(image_handle);
colormap(gray); colorbar;
title('Barrier image unfiltered');


% We check different edge filters
%edg1
filtered_edg1 = filter2(edg1, image_handle);
figure;
imagesc(filtered_edg1);
colormap(gray); colorbar;
title('Barrier image edg1 filtered');

%edg2
filtered_edg2 = filter2(edg2, image_handle);
figure;
imagesc(filtered_edg2);
colormap(gray); colorbar;
title('Barrier image edg2 filtered');

%edg3
filtered_edg3 = filter2(edg3, image_handle);
figure;
imagesc(filtered_edg3);
colormap(gray); colorbar;
title('Barrier image edg3 filtered');

%edg4
filtered_edg4 = filter2(edg4, image_handle);
figure;
imagesc(filtered_edg4);
colormap(gray); colorbar;
title('Barrier image edg4 filtered');

%edg5
filtered_edg5 = filter2(edg5, image_handle);
figure;
imagesc(filtered_edg5);
colormap(gray); colorbar;
title('Barrier image edg5 filtered');

%edg6
filtered_edg6 = filter2(edg6, image_handle);
figure;
imagesc(filtered_edg6);
colormap(gray); colorbar;
title('Barrier image edg6 filtered');

%edg7
filtered_edg7 = filter2(edg7, image_handle);
figure;
imagesc(filtered_edg7);
colormap(gray); colorbar;
title('Barrier image edg7 filtered');


% We check with thresholding
threshold = -30;
thr_edg5 = filtered_edg5 > threshold;
figure;
imagesc(thr_edg5);
colormap(gray); colorbar;
title(['Thresholded edg5. Threshold = ', num2str(threshold)]);