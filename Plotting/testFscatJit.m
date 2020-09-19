% Test FscatJit2 and FscatJit2_mergeGroups

% Mamma mia
clear all
clc
close all
%% 
% load('FscatJit_data.mat') %for two genotypes
% load('FscatJit_data_five.mat') % for 5 genotypes
% load ageingfbmm.mat % for debugging reverse axis
% load NaLactaefbmm.mat
% load lightcurvefbmm.mat
% % for n-genotypes
% clearvars -except fbmm
% identifiers = fbmm.szGenotype;
% data = fbmm.AngVbyEpoch(:,2);

% This option to test numeric identifiers
% a=rand(length(identifiers),1);
% b=a*4;
% identifiers=ceil(b);
% identifiers(1:45)=7;

% Generate artificial data
reps=20;
% id={'abrams', 'daddy'}';% , 'tank', 'blah', 'blech', 'cch', 'blargh', 't', 'y', 'fgh', 'sdgh', 'sryj', 'wetrh'}';
id={'abrams', 'daddy', 'tank', 'blah', 'blech', 'cch'}';%, 'blargh', 't', 'y', 'fgh', 'sdgh', 'sryj', 'wetrh'}';
% id={'abrams', 'daddy', 'tank', 'blah', 'blech', 'cch', 'blargh', 't', 'y', 'fgh', 'sdgh', 'sryj', 'wetrh'}';
identifiers=repmat(id, reps, 1);
data=rand(length(identifiers), 1);
FscatJit_orig(identifiers,data);
FscatJit2(identifiers,data,'plotType','both');