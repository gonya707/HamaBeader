clc;clear;close all;

map=xlsread('completeMap.xlsx');
map=map./255;

img=imread('imagen.png');
  
  figure;
  
  subplot(3,1,1);
  imshow(img);
  
  subplot(3,1,2);
  [dout1, dout1map]=rgb2ind(img, map, 'nodither');
  imshow(dout1, dout1map);
  
  subplot(3,1,3);
  [dout2, dout2map]=rgb2ind(img, map, 'dither');
  imshow(dout2, dout2map);