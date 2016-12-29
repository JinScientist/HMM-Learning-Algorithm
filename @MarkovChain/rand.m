function S=rand(mc,T)
%S=rand(mc,T) returns a random state sequence from given MarkovChain object.
%
%Input:
%mc=    a single MarkovChain object
%T= scalar defining maximum length of desired state sequence.
%   An infinite-duration MarkovChain always generates sequence of length=T
%   A finite-duration MarkovChain may return shorter sequence,
%   if END state was reached before T samples.
%
%Result:
%S= integer row vector with random state sequence,
%   NOT INCLUDING the END state,
%   even if encountered within T samples
%If mc has INFINITE duration,
%   length(S) == T
%If mc has FINITE duration,
%   length(S) <= T
%
%---------------------------------------------
%Code Authors:Jin Huang
%---------------------------------------------

S=zeros(1,T);%space for resulting row vector
nS=mc.nStates;
pInit=mc.InitialProb;

pD=DiscreteD(pInit);
A=mc.TransitionProb;
pt=pInit;     %state distribution prob at time t
S(1)=pD.rand(1);
if finiteDuration(mc)
for t=1:T-1;

  pt=A(S(t),:);
     pD=DiscreteD(pt);
     S(t+1)=pD.rand(1);
  if S(t+1)==nS+1
    S=S(:,1:t);
    break
     
  else end
    
end
 
else
for t=1:T-1
     pT=A(S(t),:);
     pD=DiscreteD(pT);
     S(t+1)=pD.rand(1);   
     
end
end
        
        

