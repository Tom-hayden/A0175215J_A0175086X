% This file implements a CNN classifier.
% Tom Hayden, Mario Gini

%Define the training and test batch size.

dataProcessOptions.trainsize = 10000;       %value between 1 and 50000
dataProcessOptions.preprocessing = 'none'; %valid values are 'none' and 'all'
dataProcessOptions.augmentation = 'mirror';  %valid values are 'none', 'mirror' and 'all'


%First aquire all data. This should not be changed.
dataAquisition();

%Preprocess and augment
[Data_cpy, Labels_cpy, test_cpy] = dataPreProcAndAug(cifarData,cifarLabels,dataProcessOptions);

% Reshape the data into the formar required for a CNN
[Data_CNN, Labels_CNN] = dataReshapeCNN(Data_cpy, Labels_cpy);


%first load the cifar-10 data set and split into validate and train data
%sets.


%Now train data contains the batch data with the data label added as an
%extra columnn
% 
% 
%Layers taken from https://www.mathworks.com/help/nnet/examples/create-simple-deep-learning-network-for-classification.html
layers = [
    imageInputLayer([32,32,3])
    convolution2dLayer(3,16,'Padding',1)
    reluLayer

    maxPooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,32,'Padding',1)

    reluLayer

    maxPooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,64,'Padding',1)

    reluLayer

    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];
 
trainOptions = trainingOptions('sgdm',...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropFactor',0.2,...
    'LearnRateDropPeriod',5,...
    'MaxEpochs',50,...
    'MiniBatchSize',64,...
    'VerboseFrequency',20);

convnet = trainNetwork(Data_CNN,Labels_CNN,layers,trainOptions);


