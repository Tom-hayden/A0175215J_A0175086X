function [Data_cpy, Labels_cpy] = dataPreProcAndAug(cifarData,cifarLabels,trainSize,options)
%preprocess and augment the data.

if strcmp(options.preprocessing,'all')
    Data_cpy = dataPreProcessing(cifarData, trainSize);
    Labels_cpy = cifarLabels(1:trainSize,:);
end

if strcmp(options.preprocessing,'none')
    Data_cpy = cifarData(1:trainSize,:);
    Labels_cpy = cifarLabels(1:trainSize,:);
end

if strcmp('all',options.augmentation)
    [Data_cpy, Labels_cpy] = dataAugmentation(Data_cpy,Labels_cpy,trainSize,false);
end
if strcmp('mirror',options.augmentation)
    [Data_cpy, Labels_cpy] = dataAugmentation(Data_cpy,Labels_cpy,trainSize,onlyFlip);
end
end

%Data has now been preprocessed and augmented and it is time to train.