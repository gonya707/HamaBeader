clc;clear;close all;

img=imread('marche.png');

map=xlsread('completeMap.xlsx');
map=map./255;

figure();
subplot(1,3,1);
imshow(img);
title('Original')
subplot(1,3,2);
[dout1, dout1map]=rgb2ind(img, map, 'nodither');
imshow(dout1, dout1map);
title('Sin dither')
subplot(1,3,3);
[dout2, dout2map]=rgb2ind(img, map, 'dither');
imshow(dout2, dout2map);
title('Con dither')

