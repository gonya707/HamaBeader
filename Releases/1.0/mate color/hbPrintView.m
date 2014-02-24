function hbPrintView(img)
    close all;
    map=xlsread('completeMap.xlsx');
    map=map./255;
    figure('units','normalized','outerposition',[0 0 1 1])
    imshow(img,map,'InitialMagnification',2000);
    
    [m n]=size(img);
    
    for i=1:m
        for j=1:n
            pixel=img(i,j);
            text(0.8+(j-1)*1 ,1+(i-1)*1 ,num2str(pixel));
        end
    end

end