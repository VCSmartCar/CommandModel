disp('开始输出');
tmp = cos([0:127] * pi / 128);
disp('实部');
for i=1:128
    fprintf('%f,', tmp(i));
    if rem(i,10)==0
        fprintf('\n');
    end
end
fprintf('\n');
tmp = sin([0:127] * pi / 128) * (-1);
disp('虚部');
for i=1:128
    fprintf('%f,', tmp(i));
    if rem(i,10)==0
        fprintf('\n');
    end
end
fprintf('\n');