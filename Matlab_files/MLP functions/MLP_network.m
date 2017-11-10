% This file implements a MLP classifier.
% Mario Gini, Tom Hayden

% define the training and test batch size.

options.trainsize = 50000;       %value between 1 and 50000
options.preprocessing = 'all'; %valid values are 'none' and 'all'
options.augmentation = 'mirror';
options.trainFcn =  'trainscg';
options.layers = [100 100];
options.performFcn = 'crossentropy'; % many valid options



%First aquire all data. This should not be changed.
dataAquisition();

% train and test the MLP classifier.
% [net, sucessRateTraining] = networkTraining(50,cifarData(1:trainSize,:),cifarLabels(1:trainSize,:));
% sucessRateTesting = networkTesting(net, cifarData(trainSize+1:testEnd,:), cifarLabels(trainSize+1:testEnd,:));

% [net, sucessRateTraining] = networkTraining(50,cifarDataMirrored,cifarLabelsMirrored);
% sucessRateTesting = networkTesting(net, cifarData(trainSize+1:testEnd,:), cifarLabels(trainSize+1:testEnd,:));

sucessRateTesting = zeros(6,5);
trainTime = zeros(6,5);
netStore = cell(5,1);
for i = 1 : 5
    %options.layers = [100 options.layers(2)+100 ];
    [Data_cpy, Labels_cpy, test_cpy] = dataPreProcAndAug(cifarData,cifarLabels,options);
    tic
    [netStore{i,1}, sucessRateTraining] = networkTraining(Data_cpy,Labels_cpy,options);
    sucessRateTesting(i) = networkTesting(netStore{i,1}, test_cpy, cifarLabels(50001:60000,:));
    trainTime(i) = toc;
end


% 
% for i = 1 : 9
%     options.layers = [0 options.layers(2)+10];
%     for j = 1 : 9
%         options.layers = [options.layers(1)+10 options.layers(2)];
%         for k = 1 : 5
%             [Data_cpy, Labels_cpy, test_cpy] = dataPreProcAndAug(cifarData,cifarLabels,options);
%             tic
%             [net, sucessRateTraining] = networkTraining(Data_cpy,Labels_cpy,options);
%             sucessRateTesting(i,j,k) = networkTesting(net, test_cpy, cifarLabels(50001:60000,:));
%             trainTime(i,j,k) = toc;
%         end
%     end
% end