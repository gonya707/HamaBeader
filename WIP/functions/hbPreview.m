% function [im1 im2] = hbPreview(url) - shows the image specified in url 
% adapted for the hama beads color catalog. Also returns the adapted 
% images.  

function [im1 im2 map1] = hbPreview(url)

  map = xlsread('completeMap.xlsx');
  map = map./255;

  im = imread(url);
  
  figure;
  
  subplot(1, 3, 1);
  imshow(im);
  
  subplot(1, 3, 2);
  [im1, map1] = rgb2ind(im, map, 'nodither');
  imshow(im1, map1);
  
  subplot(1,3,3);
  [im2, map2] = rgb2ind(im, map, 'dither');
  imshow(im2, map2);
  
end