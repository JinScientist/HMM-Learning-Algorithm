clc
clear
cd C:\Users\jason\Documents\MATLAB\PattRecClasses\melody

for i=1:6
    hmms(i)=HMM();
end

songname=char(string({
    'ForeverYoung',
    'guxiang',
    'KnockingOnHeavenDoor',
    'likeArollingStone',
    'LionKing',
    'TheThirdPole'}));
D1= dir([songname(1,:), '\*.wav']); 
D2= dir([songname(2,:), '\*.wav']); 
D3= dir([songname(3,:), '\*.wav']); 
D4= dir([songname(4,:), '\*.wav']); 
D5= dir([songname(5,:), '\*.wav']);
D6= dir([songname(6,:), '\*.wav']);
%D={D1,D2,D3,D4,D5};
hmms(1)=TrainMelody(8,D1);
hmms(2)=TrainMelody(8,D2);
hmms(3)=TrainMelody(8,D3);
hmms(4)=TrainMelody(4,D4);
hmms(5)=TrainMelody(12,D5);
hmms(6)=TrainMelody(8,D6); 

