function Data_cpy = dataPreProcessing(cifarData, trainSize)
% normalizes the data and subtracts the mean per pixel based on the
% training batch size.

% normalization to range [0,1]
cifarData = 1/255*cifarData;

% subtract mean per pixel. The mean is only calculated over the training
% data.
Data_cpy= cifarData - mean(cifarData(1:trainSize,:));

end