function [mant expo] = mant_exp(input, xx)
%MANT_expo(i,j)   Summary of this function goes here
%   Detailed expo(i,j)  lanation goes here
mant = zeros(size(input));
expo = zeros(size(input));
[row col] = size(input);
max = 10^xx;
min = 10^(xx - 1);
for i = 1:row
    for j = 1:col
        tmp = input(i,j);
        if tmp > max
            while tmp > max
                expo(i,j)   = expo(i,j) + 1;
                tmp = tmp / 10;
            end
        elseif tmp < min
            while tmp < min
                expo(i,j) = expo(i,j) - 1;
                tmp = tmp * 10;
            end
        end
        mant(i,j) = tmp;
    end
end

end

