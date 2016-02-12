path = 'J:\\train\';
dirs = dir([path '*0*']);
dirlen = size(dirs, 1);
myhmm_v3 = {};
for k = 1:5
    for i = 1:dirlen
        files = dir([path dirs(i).name  '\*.wav']);
        file = [path dirs(i).name  '\' files(k).name];
        %disp(dirs(i).name);
        %修改说明：后来才加上重新采样，但未测试过
        [x,Fs,bits,opt_ck] = wavread(file);
        x=zerotrim(x(:,1));%若是立体声则取左声道
        %x=fix(x/max(abs(x))*32767);
        RFs=8000;
        x=resample(x,RFs,Fs);%数据统一重采样为8000Hz
        sample(i).wave = x;
        sample(i).data = [];
    end
    myhmm_v3{k} = train_imp(sample, [3 3 3 3]);
end
save('myhmm_v3.mat', 'myhmm_v3');