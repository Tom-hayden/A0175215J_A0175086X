% This file implements a MLP classifier.
% Mario Gini, Tom Hayden

% define the training and test batch size.

options.trainsize = 5000;       %value between 1 and 50000
options.preprocessing = 'none';
options.augmentation = 'none';  %valid values are 'none', 'mirror' and 'all'
options.trainFcn =  'trainscg';
options.layers = [100 50];


%First aquire all data. This should not be changed.
dataAquisition();

%[cifarData2, mu, invMat, whMat] = whiten(cifarData);

% train and test the MLP classifier.
% [net, sucessRateTraining] = networkTraining(50,cifarData(1:trainSize,:),cifarLabels(1:trainSize,:));
% sucessRateTesting = networkTesting(net, cifarData(trainSize+1:testEnd,:), cifarLabels(trainSize+1:testEnd,:));

% [net, sucessRateTraining] = networkTraining(50,cifarDataMirrored,cifarLabelsMirrored);
% sucessRateTesting = networkTesting(net, cifarData(trainSize+1:testEnd,:), cifarLabels(trainSize+1:testEnd,:));

sucessRateTesting = zeros(9,5);
trainTime = zeros(9,5);

for i = 1 : 9
    options.trainsize = options.trainsize + 5000;
    
    for j = 1 : 5
        [Data_cpy, Labels_cpy, test_cpy] = dataPreProcAndAug(cifarData,cifarLabels,options);
        tic
        [net, sucessRateTraining] = networkTraining(Data_cpy,Labels_cpy,options);
        sucessRateTesting(i,j) = networkTesting(net, test_cpy, cifarLabels(50001:60000,:));
        trainTime(i,j) = toc;
    end
    
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