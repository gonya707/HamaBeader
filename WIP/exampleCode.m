clc;
clear;
close all;

map = xlsread('completeMap.xlsx');
map = map./255;

%put your image url here
img = imread('images/lena_std.tif');
  
  figure;
  
  subplot(1, 3, 1);
  imshow(img);
  title('original');
  
  subplot(1, 3, 2);
  [noDither, noDitherMap] = rgb2ind(img, map, 'nodither');
  imshow(noDither, noDitherMap);
  title('without dither');
  
  subplot(1, 3, 3);
  [dither, ditherMap] = rgb2ind(img, map, 'dither');
  imshow(dither, ditherMap);
  title('with dither');
  
  disp('histogram without dither: ');
  hbHistogram(noDither)
  disp('histogram with dither: ');
  hbHistogram(dither)