%X = RGB2IND(RGB,MAP) converts the RGB image to an indexed image X with
 %   colormap MAP by matching colors in RGB with the nearest color in the
  %  colormap MAP.  SIZE(MAP,1) must be <= 65536.
  
  clc;clear;close all;
  
  map = cptcmap('cptfiles/GMT_wysiwygcont.cpt');
  doutzen=imread('doutzen.bmp');
  
  figure;
  
  subplot(1,3,1);
  imshow(doutzen);
  
  subplot(1,3,2);
  [dout1, dout1map]=rgb2ind(doutzen, map, 'nodither');
  imshow(dout1, dout1map);
  
  subplot(1,3,3);
  [dout1, dout1map]=rgb2ind(doutzen, map, 'dither');
  imshow(dout1, dout1map);