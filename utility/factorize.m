function [ output ] = factorize(inputs)
%FACTORIZE Summary of this function goes here
%������ĺ���������ʽ�ֽ⣬inputs�Ǻ����ĴӸߴε��ʹε�ϵ��
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

