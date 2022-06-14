clc;

H = gobjects(1,6); % Allocate empty array of graphic objects

H(1) = wvtool(rectwin(64));
H(1).set('Name', 'Rectangular');

H(2) = wvtool(hamming(64));
H(2).set('Name', 'Hamming');

H(3) = wvtool(bartlett(64));
H(3).set('Name', 'Bartlett');

H(4) = wvtool(blackman(64));
H(4).set('Name', 'Blackman');

H(5) = wvtool(hanning(64));
H(5).set('Name', 'Hanning');

H(6) = wvtool(kaiser(64, 4));
H(6).set('Name', 'Kaiser');
