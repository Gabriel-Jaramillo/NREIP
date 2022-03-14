function fc_weights_parser(num)

    myfile = sprintf('fc_weights_%i', num);

    fid = fopen(myfile) ; % opens file

    header = fopen('fc_weights_0.h','w'); % make more dynamic
    
    

    while ~feof(fid)
        
        w = fread (fid, [5 5], 'uint16' );
        fprintf(header,'fc_weight_data_%i[5][5] = {', num);
        w = w';
    
        for i = 1 : numel(w)
            if i == numel(w)
                int_part = bitshift(w(i),8);
                frac_part = w(i) & 0xFF;
                result = int_part + frac_part/256.0;
                fprintf(header, '%d', result);
            else
                int_part = bitshift(w(i),8);
                frac_part = w(i) & 0xFF;
                result = int_part + frac_part/256.0;
                fprintf(header, '%d,', result);
            end
        end
        fprintf(header, '}');
        fprintf(header, '\n'); 
        break;
    end

    fclose(fid);
    fclose(header);
    
end