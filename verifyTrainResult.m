winlength=0.02;
D={D1,D2,D3,D4,D5,D6};
 %test remaining wav file to verify the performance
for j=1:6
    Dj=cell2mat(D(j));
    for r=13:16
melodyfile= sprintf(['%d.wav'], r);

[Y,FS]=audioread([Dj(1).folder,'\',melodyfile]);
frIsequence=GetMusicFeatures(Y,FS,winlength);

%lData(r)=3*size(frIsequence,2);
%testData=reshape(MyExtractor(frIsequence)',[1,lData(r)]);
testData=MyExtractor2(frIsequence);
 %test error rate store in matrix error()
% lP(1,:)=logprob(hmms,testData(1,:));
% lP(2,:)=logprob(hmms,testData(2,:));
% lP(3,:)=logprob(hmms,testData(3,:));
lP=logprob(hmms,testData(1,:));
%lPS=sum(lP,1);
[logp,result]=max(lP);
lPMatrix(4*(j-1)+r-12,:)=lP;
if result~=j
    error(j,r-12)=0;
else
    error(j,r-12)=1;
end
    end
end
error
lPMatrix

% %cell2mat(D(i)) convert cell to matrix
% ---------------------------------
% % compare the training example with generated data from Hmm(1)
[Y1,FS1]=audioread([D1(1).folder,'\','4.wav']);
frIsequence1=GetMusicFeatures(Y,FS,winlength);
trainexample=MyExtractor2(frIsequence1);
[X,S]=rand(hmms(1),length(trainexample));
figure
imagesc(trainexample(1,:));
colorbar
title('training data') 
figure
imagesc(X);
colorbar
title('Generated X') 




