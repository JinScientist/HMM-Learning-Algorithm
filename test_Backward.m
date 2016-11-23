%TEST BACKWARD

%Tester: Jin Huang

clc
clear all
%--------------------test finite mc
mc=MarkovChain;
mc.InitialProb=[1;0];
mc.TransitionProb=[0.9 0.1 0;0 0.9 0.1];
G1=GaussD;
G2=GaussD;
G2.Mean=3;
G2.StDev=2;
G=[G1;G2];
X=[-0.2,2.6,1.3];
pX=prob(G,X);
c=[1.0000 0.1625 0.8266 0.0581]
betaHat=backward(mc,pX,c)
%--------------------test infinite mc
mc2=MarkovChain;
mc2.InitialProb=[1;0];
mc2.TransitionProb=[0.9 0.1;0.9 0.1];

c2=[1.0000    0.1625    0.9811]
betaHat2=backward(mc2,pX,c2)