path = 'flowers.jpg'; % change depending on the PC and file


image_handle_RGB = imread(path); % This time we dont convert to grey. imhist does it automatically

% Histogram of the image
figure;
imhist(image_handle_RGB);
title(['Histogram of unmodified image ', path]);