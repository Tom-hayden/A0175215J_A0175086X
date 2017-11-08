function [data_cpy, test_cpy] = dataPreProcessing(cifarData, trainSize)
% normalizes the data and subtracts the mean per pixel based on the
% training batch size.

% normalization to range [0,1]
cifarData = 1/255*cifarData;

% subtract mean per pixel. The mean is only calculated over the training
% data.
cifarData= cifarData - mean(cifarData(1:trainSize,:));

data_cpy = cifarData(1:trainSize,:);
test_cpy = cifarData(50001:60000,:);
end