clc
clear all
%--------------------test forward algorithm
mc=MarkovChain;
mc.InitialProb=[1;0];
mc.TransitionProb=[0.9 0.1;0.9 0.1];
G1=GaussD;[Y1, FS1]=audioread('melody_1.wav');
G2=GaussD;
G2.Mean=3;[Y1, FS1]=audioread('melody_1.wav');
G2.StDev=2;[Y1, FS1]=audioread('melody_1.wav');
G=[G1;G2];
X=[-0.2,2.6,1.3];
pX=prob(G,X);
[alfaHat, c]=forward(mc,pX)
%--------------------test log probability of feature sequence
hmm=HMM;
hmm.StateGen=mc;
hmm.OutputDistr=G;
logP=logprob(hmm,X)