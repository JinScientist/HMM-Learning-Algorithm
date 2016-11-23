function [ features ] = MyExtractor( frIsequence )
%this function gives further process of features matrix frlsequence
%provided by function'GetMusicFeatures'
%   Author of code: Jin Huang
% This is First version, check the improved MyExtractor2.m 

A=frIsequence(1,:);
ratio = A(2:end)./A(1:end-1);
ratio=[1 ratio];
logratio=log(ratio);
edges1 = -3:log(2)/12:3;
 % discretizing fr(frequency ratio between frames)
frD=discretize(logratio,edges1);


edges2 = -15:0.05:0;
ID=discretize(log(frIsequence(3,:)),edges2); % discretizing logrithm of I_t

edges3 = 0:0.05:1;
rD= discretize(frIsequence(2,:),edges3);% discretizing r_t

features=[frD;rD;ID];
end

