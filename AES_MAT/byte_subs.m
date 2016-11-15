function out_byte = byte_subs( input, encoding )
%BYTE_SUBS Summary of this function goes here
%   Detailed explanation goes here

    [sbox_table,inv_sbox_table] = getGlobal;
    if(encoding == 'e')
        % Byte substitution
        for i = 0:length(input)-1
            hexnum = dec2hex(input(i+1));
            if (length(hexnum) == 1)
                hexnum = cat(2,'0', hexnum);
            end
            % Sbox lookup
            out_byte(i+1) = sbox_table(hex2dec(hexnum(1))+1,hex2dec(hexnum(2))+1);
        end
    elseif(encoding == 'd') 
        % Byte substitution
        for i = 0:length(input)-1
            hexnum = dec2hex(input(i+1));
            if (length(hexnum) == 1)
                hexnum = cat(2,'0', hexnum);
            end
            % Sbox lookup
            out_byte(i+1) = inv_sbox_table(hex2dec(hexnum(1))+1,hex2dec(hexnum(2))+1);
        end

    else
        disp('No encoding specified');
    end

end

%     DEBUG
%     disp('Sbox Ouputs:')
%     disp(out_byte)

