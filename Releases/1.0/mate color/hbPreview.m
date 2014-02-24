function [im1 im2 map1] = hbPreview(cadena)

    map=xlsread('completeMap.xlsx');
    map=map./255;

    im=imread(cadena);
  
  figure;
  
  subplot(1,3,1);
  imshow(im);
  
  subplot(1,3,2);
  [im1, map1]=rgb2ind(im, map, 'nodither');
  imshow(im1, map1);
  
  subplot(1,3,3);
  [im2, map2]=rgb2ind(im, map, 'dither');
  imshow(im2, map2);
  
end