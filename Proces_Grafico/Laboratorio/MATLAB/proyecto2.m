function y = proyecto2(x)
            
            b = hex.HexUtils.hex2bin(x);
           
            % sign, exponent, fraction
            s = b(:, 1);
            e = b(:, 2:9);
            f = b(:, 10:32);
           
            y = (-1).^s .* 2.^(bin2dec(e) - 127) .* (1 + bin2dec(f)./2^23);
           
        end