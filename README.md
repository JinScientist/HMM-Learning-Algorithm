# HMM-Learning-Algorithom
Implement song recognizer machine learning system with HMM model
The training code has been tested on 8 songs data set with 15 samples for each song, with which 10 samples as training data and 5 samples as test data. The correct recognition rate was **100%**.
Most standard HMM class here is from provided course code. Below are contributed codes for this implementation:

* Create random scalar for given discrete distribution mass:  [@DiscreteD/rand.m](https://github.com/JinScientist/HMM-Learning-Algorithom/blob/master/%40DiscreteD/rand.m)
* Caculate logrithm likehood probability of given training song sample: [@HMM/logprob.m](https://github.com/JinScientist/HMM-Learning-Algorithom/blob/master/%40GaussD/logprob.m)
  * Feature Extractor of song melody:[HMM-Learning-Algorithom/GetMusicFeatures/MyExtractor2.m](https://github.com/JinScientist/HMM-Learning-Algorithom/blob/master/GetMusicFeatures/MyExtractor2.m)
  * HMM model Training Code:[TrainMelody.m](https://github.com/JinScientist/HMM-Learning-Algorithom/blob/master/TrainMelody.m)
 


