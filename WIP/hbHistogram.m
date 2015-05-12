% function r = hbHistogram(img) - Calculates the hama bead histogram for a
% given indexed image. 

function r = hbHistogram (values, img)
    values = values(:, 1);

    l = length(values);
    r = zeros(l, 1);
    
    for i=1:l
        r(i) = sum(sum(i - 1 == img));
    end
    
   end