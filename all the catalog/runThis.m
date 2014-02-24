clc;clear;close all;

map=xlsread('completeMap.xlsx');
map=map./255;

img=imread('imagenes/doutzen.bmp');
  
  figure;
  
  subplot(1,3,1);
  imshow(img);
  title('original');
  
  subplot(1,3,2);
  [dout1, dout1map]=rgb2ind(img, map, 'nodither');
  imshow(dout1, dout1map);
  title('sin dither');
  
  subplot(1,3,3);
  [dout2, dout2map]=rgb2ind(img, map, 'dither');
  imshow(dout2, dout2map);
  title('con dither');
  
  disp('histograma sin dither: ');
  hbHistogram(dout1)
  disp('histograma con dither: ');
  hbHistogram(dout1)