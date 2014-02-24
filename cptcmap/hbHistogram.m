function r=hbHistogram(img)
    nombres=importdata('colores.txt');

    l=length(nombres);
    r=zeros(l,1);
    
    
    for i=1:l
        r(i)=sum(sum(i==img));
    end
    
    r=[nombres num2cell(r)];
    
end