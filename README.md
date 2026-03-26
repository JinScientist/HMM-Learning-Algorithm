# HMM Learning Algorithm — Song Recognizer

A **Hidden Markov Model (HMM)** based music/song recognizer implemented in MATLAB. Trained on 8 songs with 15 samples each (10 train, 5 test) achieving **100% recognition accuracy**.

## Overview

This project builds a complete HMM pipeline for recognizing songs from audio features:
- Extract melody features from audio files
- Train a separate HMM model per song using the Baum-Welch algorithm
- Classify unknown samples by comparing log-likelihood across all trained models

## Files

### Core HMM Classes

| File | Description |
|------|-------------|
| `@HMM/HMM.m` | HMM model constructor |
| `@HMM/train.m` | Baum-Welch training algorithm |
| `@HMM/logprob.m` | Log-likelihood of observed sequence |
| `@HMM/rand.m` | Generate random HMM output sequences |
| `@HMM/viterbi.m` | Viterbi decoding |

### Markov Chain

| File | Description |
|------|-------------|
| `@MarkovChain/MarkovChain.m` | Markov chain constructor |
| `@MarkovChain/forward.m` | Forward algorithm |
| `@MarkovChain/backward.m` | Backward algorithm |
| `@MarkovChain/rand.m` | Generate random state sequences (finite & infinite) |
| `@MarkovChain/viterbi.m` | Viterbi state decoding |

### Emission Distributions

| File | Description |
|------|-------------|
| `@GaussD/` | Gaussian distribution class |
| `@GaussMixD/` | Gaussian Mixture distribution class |
| `@DiscreteD/` | Discrete distribution class |
| `@DiscreteD/rand.m` | Random scalar from discrete distribution |

### Feature Extraction

| File | Description |
|------|-------------|
| `GetMusicFeatures/MyExtractor2.m` | Melody feature extractor from audio |
| `GetMusicFeatures/MusicFromFeatures.m` | Reconstruct audio from features |
| `GetMusicFeatures/GetMusicFeatures.m` | Main feature extraction wrapper |

### Training & Demo Scripts

| File | Description |
|------|-------------|
| `TrainMelody.m` | **Main training script** — trains one HMM per song |
| `TrainingDemo.m` | End-to-end demo of training and recognition |
| `MakeErgodicHMM.m` | Create an ergodic HMM |
| `MakeLeftRightHMM.m` | Create a left-right HMM |
| `MakeGMM.m` | Create a Gaussian Mixture Model |
| `livedemo.m` | Live recognition demo |

### Test Scripts

| File | Description |
|------|-------------|
| `test_Forward.m` | Unit test for forward algorithm |
| `test_Backward.m` | Unit test for backward algorithm |
| `test_lecture_1.m` | Lecture example verification |
| `verifyTrainResult.m` | Verify training convergence |

## Requirements

- MATLAB (tested with R2016b+)
- Audio Toolbox (for feature extraction)

## Usage

### Train models on your song dataset

```matlab
% Place audio samples in your data directory
% Run the training script
TrainMelody
```

### Run the full demo

```matlab
TrainingDemo
```

### Live recognition

```matlab
livedemo
```

## How It Works

1. **Feature Extraction** — `MyExtractor2.m` extracts melody features (pitch, rhythm) from each audio sample
2. **Model Training** — One HMM is trained per song using Baum-Welch (EM) via `HMM/train.m`
3. **Recognition** — For an unknown sample, compute log-likelihood against all trained HMMs; the highest score wins

## Performance

Tested on 8 songs × 15 samples (10 train / 5 test):

| Songs | Training Samples | Test Samples | Accuracy |
|-------|-----------------|--------------|----------|
| 8     | 10 per song     | 5 per song   | **100%** |
