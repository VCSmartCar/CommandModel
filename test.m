

%对于测试集中的所有文件,求出错误率
tic
path = 'J:\stand by\';
dirs = dir([path '*0*']);
file_sum = 0;
error_sum = 0;
for k = 1:size(dirs)
    fprintf('识别第%d个文件夹\n', k);
    fprintf(dirs(k).name);
    files = dir([path dirs(k).name '\*.wav']);
    for i=1:size(files)
        allPath = [path dirs(k).name '\' files(i).name];
        
        [x,Fs,bits,opt_ck] = wavread(allPath);
        x=zerotrim(x(:,1));%若是立体声则取左声道
        %x=fix(x/max(abs(x))*32767);
        RFs=8000;
        x=resample(x,RFs,Fs);%数据统一重采样为8000Hz
        
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
        fprintf('第%d个词, 识别为%d\n', i,n)
        if i ~= n
            error_sum = error_sum + 1;
        end
    end
    fprintf('错误个数为%d\n', error_sum);
end
fprintf('错误个数为%d\n', error_sum);
disp(['识别的总时间为' num2str(toc)]);