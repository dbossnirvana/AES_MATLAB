
function plaintext_recov = aes_decryption(ciphertext,round_keys)

% Intro
fprintf('\n****AES Decryption****\n\n')
fprintf('\nCiphertext is:\n'); disp(char(ciphertext)); 
fprintf('\n\nKey is:\n'); disp(char(reshape(round_keys(:,:,1)',[1 16])));

% Preallocations
global m prim_poly fixM_d;
decrypt = 'd'; % Encoding Mode. 'e' for encryption. 'd' for decryption.
r = 10; % initial decryption round

% Initial Key Addition Layer; round (r) = 10
input = bitxor(ciphertext,reshape(round_keys(:,:,r+1)', [1 16]));

while(r >= 1 )
    
    % MixColumn Sublayer
    if (r <= 9 && r >= 1)
        C = reshape(input, [4 4]);
        B = gf(fixM_d,m,prim_poly) * gf(C,m,prim_poly);
        B = gf2dec(B,8,prim_poly);
    end
    
    % Inv ShiftRows Sublayer
    % Shifting
    if(r == 10)
        input = reshape(input, [4 4]);
        for i = 1:3
            input(i+1,:) = circshift(input(i+1,:),[0,i]);
        end
        % Initial Inv Byte substitution
        out_byte = byte_subs(reshape(input,[1 16]),decrypt);
    else
        B = reshape(B, [4 4]);
        for i = 1:3
            B(i+1,:) = circshift(B(i+1,:),[0,i]);
        end
        %Inv Byte substitution
        out_byte = byte_subs(reshape(B,[1 16]),decrypt);
    end
    
    % Key Addition Layer
    input = bitxor(out_byte,reshape(round_keys(:,:,(r-1)+1)', [1 16]));
    r = r - 1;
end

plaintext_recov = input;
fprintf('\nPlaintext is\n')
disp(char(plaintext_recov));
fprintf('\n****END OF DECRYPTION****\n\n');