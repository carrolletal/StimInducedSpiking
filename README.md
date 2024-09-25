# StimInducedSpiking
a software suite for visualizing and analyzing visual cortical activity as modulated by sensory stimuli, ontogenetic perturbations, and behavioral states


This repository hosts a pipeline for the handling of extracellular recordings.  The current version is tailored for recordings using an A32 Neuronexus probe, a Blackrock Neurotech interface, and the Central software.  


# Data Structure


# Relating spiking activity to sensory stimuli and optogenetic perturbations
The matlab code SpikeSorttoBin uses elements of Blackrock Neurotech's Neural Processing Matlab Kit  to perform stimulus triggered averaging.  This code also offers a variety of ways to visualize the results, which may be selected by flags.  


#Code for assessing pupil size
Behavioral states are assessed through pupil size captured using pylon software.  Two pieces of python code manage the collection and compilation of camera frames into video. The resulting videos can be input to FaceMap for quantification.

