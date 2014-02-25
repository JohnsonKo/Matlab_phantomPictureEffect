%% Load image data
pic1 = imread('Snapshot1.bmp');
pic2 = imread('Snapshot2.bmp');
pic3 = imread('Snapshot3.bmp');

%% Display image 1
image(pic1);
axis equal; axis off;

%% Display image 2
image(pic2);
axis equal; axis off;

%% Display image 3
image(pic3);
axis equal; axis off;

%% Scale and display image 1
duller1 = 0.4*pic1;
image(duller1);
axis equal; axis off;

%% Scale and display image 2
duller2 = 0.7*pic2;
image(duller2);
axis equal; axis off;

%% Add the images 1
mode = 'Average';
C = blendMode(duller2, duller1, mode);
image(C);
axis equal; axis off;
%% Add the images 2
mode = 'Average';
D = blendMode(pic3, C, mode);
image(D);
axis equal; axis off;