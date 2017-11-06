% This file implements a MLP classifier.
% Mario Gini, Tom Hayden

% define the training and test batch size.

options.trainsize = 50000;       %value between 1 and 50000
options.preprocessing = 'all';
options.augmentation = 'mirror';  %valid values are 'none', 'mirror' and 'all'
options.trainFcn =  'trainscg';
options.layers = [100 50];


%First aquire all data. This should not be changed.
dataAquisition();


[Data_cpy, Labels_cpy, test_cpy] = dataPreProcAndAug(cifarData,cifarLabels,trainSize,options);

%[cifarData2, mu, invMat, whMat] = whiten(cifarData);

% train and test the MLP classifier.
% [net, sucessRateTraining] = networkTraining(50,cifarData(1:trainSize,:),cifarLabels(1:trainSize,:));
% sucessRateTesting = networkTesting(net, cifarData(trainSize+1:testEnd,:), cifarLabels(trainSize+1:testEnd,:));

% [net, sucessRateTraining] = networkTraining(50,cifarDataMirrored,cifarLabelsMirrored);
% sucessRateTesting = networkTesting(net, cifarData(trainSize+1:testEnd,:), cifarLabels(trainSize+1:testEnd,:));

sucessRateTesting = zeros(1,1);

for i = 1 : 1
 tic
 [net, sucessRateTraining] = networkTraining(Data_cpy,Labels_cpy,options);
 sucessRateTesting(i,1) = networkTesting(net, test_cpy, cifarLabels(50001:60000,:));
 toc
end




% View the Network
% view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotconfusion(t,y)
%figure, plotroc(t,y)