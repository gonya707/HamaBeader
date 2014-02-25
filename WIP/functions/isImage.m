function [r errorMsg] = isImage (img)

    errorMsg = '';
    r = 1;
    
    [X Y Z] = size(img);
    if (Z ~= 3)
        r = 0;
        errorMsg = [errorMsg 'Image has not a valid mode. Most probably the image is indexed and not in RGB mode.'];
    end



    %TODO more errors


end