disp('��ʼ���');
tmp = cos([0:127] * pi / 128);
disp('ʵ��');
for i=1:128
    fprintf('%f,', tmp(i));
    if rem(i,10)==0
        fprintf('\n');
    end
end
fprintf('\n');
tmp = sin([0:127] * pi / 128) * (-1);
disp('�鲿');
for i=1:128
    fprintf('%f,', tmp(i));
    if rem(i,10)==0
        fprintf('\n');
    end
end
fprintf('\n');