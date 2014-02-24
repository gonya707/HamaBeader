%function hbAdjust(img,k)
% elimina los colores que usen menos de k hama beads para optimizar
% presupuesto

%%%pruebas
img=b;
k=20;
%%%%

    nombres=importdata('colores.txt');

    
    l=length(nombres);
    r=zeros(l,1);
    
    
    for i=1:l
        r(i)=sum(sum(i-1==img));
    end

    map=xlsread('completeMap.xlsx');
    map=map./255;
    
    map(r<20,:)=1;
    

%end
