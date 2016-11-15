function plaintext_zeros = zerofill(plaintext)

    if(length(plaintext) >= 1 && length(plaintext) < 16)
        for i = length(plaintext)+1:16
            plaintext(i) = 0;
        end
    elseif(length(plaintext) > 16)
        error('Input plaintext has to be between 1 and 16 characters.');
    elseif(isempty(plaintext))
        error('No input plaintext given');        
    end
    
    plaintext_zeros = plaintext;

end