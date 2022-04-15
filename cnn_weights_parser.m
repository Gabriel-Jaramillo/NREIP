function cnn_weights_parser()

    myfile = sprintf('cnn_weights');

    fid = fopen(myfile) ; % opens file

    header = fopen('cnn_weights.h','w'); % make more dynamic
    
    count = 0;
    
    for j = 1 : 32
        while ~feof(fid)
            w = fread (fid,(26), 'int16' );
            fprintf(header,'float cnn_weight_data_%i[5][5] = {', j);
            w = w';
            for i = 1 : numel(w)
                if i == numel(w)
                    fprintf(header,'}\nfloat bias_%i = ', j);
                    w = w';
                    result = w(i)/256.0;
                    fprintf(header, '%d', result);
                    count = count+1;
                else    
                    result = w(i)/256.0;
                    fprintf(header, '%d,', result);
                    count = count+1;
                
                end
            end
            %fprintf(header, '}');
            fprintf(header, '\n'); 
            break;
        end
    end
    
    
    fprintf('%i', count);
    fclose(fid);
    fclose(header);
    
end