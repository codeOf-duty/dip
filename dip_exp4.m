% Generating Image Pattern

a= zeros(10,10);
b = ones(10,10);
mat1 = [ a b a b a b a b;
         b a b a b a b a;
         a b a b a b a b;
         b a b a b a b a;
         a b a b a b a b;
         b a b a b a b a;
    ];

img = mat2gray(mat1);
imshow(img);

% Rotation of image

rotated = imrotate(img,45);
figure
imshow(rotated);

rot = imrotate(img,-45);
figure
imshow(rot);

% Contrast Stretching of image

org = imread('face.jpg');
g1 = rgb2gray(org);
%contrast stretching
contrast_st = imadjust(g1,stretchlim(g1),[]);
% power law transform
gamma1 = 4;
c1 = 255/((255)^gamma1);
im1 = c1*g1.^gamma1;

gamma2 = 5;
c2 = 255/((255)^gamma2);
im2 = c2*g1.^gamma2;

% log transform
c3 = 255/log(256);
im3 = c3*log(double(g1+1));

subplot(2,3,1); subimage(org);
subplot(2,3,2); subimage(g1);
subplot(2,3,3); subimage(contrast_st);
subplot(2,3,4); subimage(im1);
subplot(2,3,5); subimage(im2);
subplot(2,3,6); subimage(im3/255);

% Noise Generartion
im_noise = imnoise(g1,'salt & pepper',0.5);
im_noise_1 = imnoise(g1,'gaussian',0 , 0.1);
im_noise_2 = imnoise(g1,'speckle');
subplot(2,3,1); subimage(im_noise);
subplot(2,3,2); subimage(im_noise_1);
subplot(2,3,3); subimage(im_noise_2);

% Periodic Noise
s = size(g1);
[x, y] = meshgrid(1:s(2), 1:s(1) );
periodicnoise = 15*sin(2*(pi/14)*x + 2*(pi/14)*y);
noisyim = uint8(periodicnoise)+g1;
subplot(2,3,4); subimage(noisyim);





