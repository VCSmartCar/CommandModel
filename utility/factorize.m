function [ output ] = factorize(inputs)
%FACTORIZE Summary of this function goes here
%对输入的函数进行因式分解，inputs是函数的从高次到低次的系数
%   Detailed explanation goes here
len = length(inputs);
a = '';
for i = 0:len - 1
    if i == 0
        b = sprintf('%f*z^-%d', inputs(i+1), i);
    else
        b = sprintf(' + %f*z^-%d', inputs(i+1), i);
    end
    a = strcat(a, b);
end
output = factor(sym(a));

end

