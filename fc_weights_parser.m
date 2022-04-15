function fc_weights_parser(num)

    myfile = sprintf('fc_weights_%i', num);

    fid = fopen(myfile) ; % opens file

    header = fopen('fc_weights_9.h','w'); % make more dynamic
    
    
    for j = 1 : 32
        while ~feof(fid)
            w = fread (fid, [14 14], 'int16' );
            fprintf(header,'fc_weight_data_%i_%i[14][14] = {', num, j);
            w = w';
    
            for i = 1 : numel(w)
                if i == numel(w)
                    result = w(i)/256.0;
                    fprintf(header, '%d', result);
                else
                    result = w(i)/256.0;
                    fprintf(header, '%d,', result);
                end
            end
            fprintf(header, '}');
            fprintf(header, '\n'); 
            break;
        end
    end

    fclose(fid);
    fclose(header);
    
end