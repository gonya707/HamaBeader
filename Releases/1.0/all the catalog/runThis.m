clc;clear;close all;

map=xlsread('completeMap.xlsx');
map=map./255;

%put here your image url
img=imread('images/lena_std.tif');
  
  figure;
  
  subplot(1,3,1);
  imshow(img);
  title('original');
  
  subplot(1,3,2);
  [dout1, dout1map]=rgb2ind(img, map, 'nodither');
  imshow(dout1, dout1map);
  title('without dither');
  
  subplot(1,3,3);
  [dout2, dout2map]=rgb2ind(img, map, 'dither');
  imshow(dout2, dout2map);
  title('with dither');
  
  disp('histogram without dither: ');
  hbHistogram(dout1)
  disp('histogram with dither: ');
  hbHistogram(dout1)