function p = pdf(m, v, x)
%�����Ԫ��˹�ܶȺ���
%����:
%  m -- ��ֵ����, SIZE*1
%  v -- ��������, SIZE*1
%  x -- ��������, SIZE*1
%���:
%  p -- �������
a = -0.5 * sum((x-m).^2 ./ v);

p = (2 * pi * prod(v)) ^ -0.5 * exp(a);

%}
%p = (2 * pi * prod(v)) ^ -0.5 * exp(-0.5 * (x-m)./v * (x-m)');