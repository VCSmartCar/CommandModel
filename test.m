

%���ڲ��Լ��е������ļ�,���������
tic
path = 'J:\stand by\';
dirs = dir([path '*0*']);
file_sum = 0;
error_sum = 0;
for k = 1:size(dirs)
    fprintf('ʶ���%d���ļ���\n', k);
    fprintf(dirs(k).name);
    files = dir([path dirs(k).name '\*.wav']);
    for i=1:size(files)
        allPath = [path dirs(k).name '\' files(i).name];
        
        [x,Fs,bits,opt_ck] = wavread(allPath);
        x=zerotrim(x(:,1));%������������ȡ������
        %x=fix(x/max(abs(x))*32767);
        RFs=8000;
        x=resample(x,RFs,Fs);%����ͳһ�ز���Ϊ8000Hz
        
        %fprintf(files(i).name);
        [x1 x2] = vad(x);
        
        m = mfcc(x);
        if x1 > 2
            x1 = x1 - 2;
        end
        if x2 > 2
            x2 = x2 - 2;
        end
        if x2 > size(m, 1)
            x2 = size(m, 1);
        end
        m = m(x1:x2,:);
        input = [];
        pout = [];
        for j=1:size(files)
            pout(j) = viterbi(myhmm_v3{j}, m);
        end


        [d,n] = max(pout);
        fprintf('��%d����, ʶ��Ϊ%d\n', i,n)
        if i ~= n
            error_sum = error_sum + 1;
        end
    end
    fprintf('�������Ϊ%d\n', error_sum);
end
fprintf('�������Ϊ%d\n', error_sum);
disp(['ʶ�����ʱ��Ϊ' num2str(toc)]);