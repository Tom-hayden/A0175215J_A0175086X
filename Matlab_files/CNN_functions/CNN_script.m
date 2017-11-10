% This file implements a CNN classifier.
% Tom Hayden, Mario Gini
%Add cifar to path.

addpath(genpath('../cifar-10-batches-mat'));

%first load the cifar-10 data set and split into validate and train data
%sets.

NbatchesTrain = 4;
NbatchesValidate = 1;

%%%%%% %Preallocating train dataset

img_dataTrain = uint8(zeros(32,32,3,10000*NbatchesTrain));
img_labelsTrain = uint8(zeros(10000*NbatchesTrain,1));

for i = 1:NbatchesTrain
    load(strcat('data_batch_',num2str(i)))
    for j = 1 : 10000
        img_dataTrain(:,:,:,(i-1)*10000 +j) = rot90(reshape(data(j,:),[32,32,3]),3);
    end
   img_labelsTrain((i-1)*10000+1:i*10000) = labels;
end

%Now create catagorical vector of labels.
keySet = [0 1 2 3 4 5 6 7 8 9];
valueSet = {'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'};
img_labelsTrain = categorical(img_labelsTrain,keySet,valueSet);

% just to be sure, clear loaded data
clear data labels;

%Preallocating validation dataset
img_dataValidate = uint8(zeros(32,32,3,10000*NbatchesValidate));
img_labelsValidate = uint8(zeros(10000*NbatchesValidate,1));

% use one batch for validation

load(strcat('data_batch_',num2str(NbatchesTrain+1)))
for j = 1 : 10000
    img_dataValidate(:,:,:,j) = rot90(reshape(data(j,:),[32,32,3]),3);
end
img_labelsValidate(:) = labels;

%Now create catagorical vector of labels.
keySet = [0 1 2 3 4 5 6 7 8 9];
valueSet = {'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'};
img_labelsValidate = categorical(img_labelsValidate,keySet,valueSet);

% to be sure, clear loaded data
clear data labels;

%%%% setup network architecture

layers = [
    imageInputLayer([32,32,3])
    
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer

    maxPooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,32,'Padding',1)
    batchNormalizationLayer
    reluLayer

    maxPooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,64,'Padding',1)
    batchNormalizationLayer
    reluLayer

    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];
 
trainOptions = trainingOptions('sgdm',...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropFactor',0.2,...
    'LearnRateDropPeriod',5,...
    'MaxEpochs',50,...
    'MiniBatchSize',128,...
    'ValidationData',{img_dataValidate,img_labelsValidate},...
    'ValidationPatience',5,...
    'ValidationFrequency',100,...
    'Plots','training-progress');

convnet = trainNetwork(img_dataTrain,img_labelsTrain,layers,trainOptions);
