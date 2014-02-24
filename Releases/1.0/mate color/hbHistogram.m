function r=hbHistogram(img)
    names=importdata('colors.txt');
 
    l=length(names);
    r=zeros(l,1);
    
    
    for i=1:l
        r(i)=sum(sum(i-1==img));
    end
    
    r=[names num2cell(r)];
    
end