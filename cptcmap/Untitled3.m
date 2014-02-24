clc;clear;close all;

map=xlsread('completeMap.xlsx');
map=map./255;

doutzen=imread('doutzen2.jpg');
  
  figure;
  
  subplot(1,3,1);
  imshow(doutzen);
  
  subplot(1,3,2);
  [dout1, dout1map]=rgb2ind(doutzen, map, 'nodither');
  imshow(dout1, dout1map);
  
  subplot(1,3,3);
  [dout2, dout2map]=rgb2ind(doutzen, map, 'dither');
  imshow(dout2, dout2map);