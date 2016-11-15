function w = key_schedule(key)

    key = double(key);
    %key_buff = zeros(1,length(key))

    % round key 0
    w = reshape(double(key), [4 4])';
    % round key 1-10
    for r = 1:10
        % Update w with: w[4*i] = w[4*(i-1)] xor g(x) where x = w[4*i] - 1
        g = g_function(w(3+1,:,(r-1)+1),r);
        w_temp = bitxor(w(0+1,:,(r-1)+1), g); 
        for j = 0:3
            % Update w with: w[4*i+j] = w[4*i+j?1] + w[4*(i?1)+j]
            if j == 0
                w(j+1,:,r+1) = w_temp;
            elseif j == 1
                w(j+1,:,r+1) = bitxor(w_temp, w(j+1,:,(r-1)+1));
            else
                w(j+1,:,r+1) = bitxor(w(j+1,:,(r-1)+1),w((j-1)+1,:,r+1));
            end
        end
    end

end