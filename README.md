# StimInducedSpiking
a software suite for visualizing and analyzing visual cortical activity as modulated by sensory stimuli, ontogenetic perturbations, and behavioral states


This repository hosts a pipeline for the handling of extracellular recordings.  The current version is tailored for recordings using an A32 Neuronexus probe, a Blackrock Neurotech interface, and the Central software. 


# Data Structure
SpikeSorttoBin's input is the result of extraction using the Maunsell lab's extractNEVData.m, and produces two relevant variables: taskEvents and taskSpikes.  taskEvents contains information about the visual and optogenetic stimuli derived from digital signals-there are many relevant variables here and this space should be explored.  taskSpikes contains information about neural spiking on channels 1-32 as well as analog signals related to visual stimuli- photodiode into channel 129- and behavioral state - camera frame captures on channel 130.  For these signals, channels are represented in column one, validated as action potentials or other in column two, and the associated timepoint in column three.  A sample dataset is provided.


# Relating spiking activity to sensory stimuli and optogenetic perturbations
The matlab code SpikeSorttoBin uses elements of Blackrock Neurotech's Neural Processing Matlab Kit  to perform stimulus triggered averaging.  This code also offers a variety of ways to visualize the results, which may be selected by flags.  


# Assessing pupil size
Behavioral states are assessed through pupil size captured using pylon software.  Two pieces of python code manage the collection and compilation of camera frames into video. The resulting videos can be input to FaceMap for quantification.


# Regression models to test predictive power of gabor stimuli, optogenetics, and pupil size on spiking activity of single cells
This code implements from the Churchland lab's ridgeMML.m in the current dataset with 10-fold cross validation.

