function [Data_cpy, Labels_cpy, test_cpy] = dataPreProcAndAug(cifarData,cifarLabels,options)
%This function call the dataPreProcessing and the dataAugmentation function
%with the appropriate arguments which are provided in the 'options' object.
%Preprocessing normalizes the data to the range [0,1] and subtracts the
%per-channel mean.
%Augmentation either mirrors the dataset or mirrors and rotates it.

trainSize = options.trainsize;

if strcmp(options.preprocessing,'all')
    [Data_cpy, test_cpy] = dataPreProcessing(cifarData, trainSize);
    Labels_cpy = cifarLabels(1:trainSize,:);
end

if strcmp(options.preprocessing,'none')
    test_cpy = cifarData(50001:60000,:);
    Data_cpy = cifarData(1:trainSize,:);
    Labels_cpy = cifarLabels(1:trainSize,:);
end

if strcmp('all',options.augmentation)
    [Data_cpy, Labels_cpy] = dataAugmentation(Data_cpy,Labels_cpy,trainSize,false);
end
if strcmp('mirror',options.augmentation)
    [Data_cpy, Labels_cpy] = dataAugmentation(Data_cpy,Labels_cpy,trainSize,true);
end
end