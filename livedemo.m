FS=22050;
winlength=0.02;
songname=char(string({
    '1 ForeverYoung',
     '2 guxiang',
    '3 KnockingOnHeavenDoor',
    '4 likeArollingStone',
    '5 LionKing',
    '6 TheThirdPole'}));
recObj = audiorecorder(22050, 16, 1);
for i=1:20
disp('Rcording....Please sing a song!')
record(recObj);
pause; 
recObj.stop;
disp('Record finish.Playing back....')
play(recObj);
pause; 
frIsequence=GetMusicFeatures(recObj.getaudiodata,FS,winlength);
testData=MyExtractor2(frIsequence); 
 
 %test error rate 
lP=logprob(hmms,testData(1,:));
[logp,result]=max(lP);
disp('This melody is from song:');
disp(songname(result,:));
%disp(lP);
plot([1:6],lP);
pause;
end


