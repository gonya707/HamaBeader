clc;
clear;

%use function textscan to simplify into 1 file

fileID = fopen('catalogValues.ini','r');
formatSpec = '%d %d %d %d';
sizeA = [4 Inf];

values = fscanf(fileID,formatSpec,sizeA)';

fileID = fopen('catalogNames.ini','r');
formatSpec = '%s';
names = textscan(fileID,formatSpec);

% names{1}{12}