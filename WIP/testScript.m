clc;
clear;
close all;

img = imread('images/doutzen.bmp');
map = xlsread('completeMap.xlsx');
map = map./255;


[newImg, newMap]=rgb2ind(img, map, 'nodither');

figure;
imshow(newImg, newMap);
title('conversion 1');
histo = hbHistogram(newImg);


newMap = [];
[M, N] = size (histo);
for i=1:M
    nCol = cell2mat(histo(i, 2));
    if (nCol > 1000) %FIXME improve this, slide and let the user set the threshold?
        newMap = [newMap map(i,:)'];
    end
end

newMap = newMap';

figure;
[imgNoDit, mapNoDit] = rgb2ind(img, newMap, 'nodither');
imshow(imgNoDit, mapNoDit);
title('conversion 2');



