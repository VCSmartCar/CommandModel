for i=1:10
	%fname = sprintf('..\\..\\ch6\\%db.wav',i-1);
    fname = sprintf('%db.wav',i-1);
	x = wavread(fname);
	[x1 x2] = vad(x);
	m = mfcc(x);
	m = m(x1-2:x2-2,:);
	for j=1:10
		pout(j) = viterbi(hmm{j}, m);
	end
	[d,n] = max(pout);
	fprintf('��%d����, ʶ��Ϊ%d\n', i-1,n)
end