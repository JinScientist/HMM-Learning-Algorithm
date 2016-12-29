% Author:Jin Huang
% D is the directory of training example
%pD is DiscreteD
function hmm=TrainMelody(nStates,D)
% pD1=DiscreteD;
% pD2=DiscreteD;
% pD3=DiscreteD;
% pD1.PseudoCount=0.5;
% pD1.PseudoCount=0.5;
% pD1.PseudoCount=0.5;
% pD=[pD1;pD2;pD3];
pD=DiscreteD;
pD.PseudoCount=0.5;
winlength=0.02;
for r=1:12
melodyfile= sprintf(['%d.wav'], r);
[Y, FS]=audioread([D(1).folder,'\',melodyfile]);
frIsequence=GetMusicFeatures(Y,FS,winlength);
% lData(3*(r-1)+1)=size(frIsequence,2);
% lData(3*(r-1)+2)=size(frIsequence,2);
% lData(3*(r-1)+3)=size(frIsequence,2);
lData(r)=size(frIsequence,2);
%obsDataR=reshape(MyExtractor(frIsequence)',[1,3*size(frIsequence,2)]);
%each sample create 3 row vector for training
obsDataR=MyExtractor2(frIsequence);
if r==1
obsData=obsDataR;
else
obsData=[obsData,obsDataR];
    end
  end
hmm=MakeLeftRightHMM(nStates,pD,obsData(1,:),lData);

end
