function r = ini2struct(url)

    fid = fopen(url);
    row = 1;

    while (~feof(fid)) 
        r(row, :) = textscan(fid, '%s %d %u %u %u','CommentStyle', ';');
        row = row + 1;
    end
    fclose(fid);
    
    %todo: struct this

end