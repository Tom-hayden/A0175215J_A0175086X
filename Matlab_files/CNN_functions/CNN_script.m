% This file implements a CNN classifier.
% Tom Hayden, Mario Gini

%Add cifar to path.

addpath(genpath('../cifar-10-batches-mat'))

%first load the cifar-10 data set and split into validate and train data
%sets.

Nbatches = 3;

%Preallocating Validate and train.
img_data = uint8(zeros(32,32,3,10000*Nbatches));
img_labels = uint8(zeros(10000*Nbatches,1));

for i = 1:Nbatches
    load(strcat('data_batch_',num2str(i)))
    for j = 1 : 10000
        img_data(:,:,:,(i-1)*10000 +j) = rot90(reshape(data(j,:),[32,32,3]),3);
    end
   img_labels((i-1)*10000+1:i*10000) = labels;
end


%Now create catagorical vector of labels.
keySet = [0 1 2 3 4 5 6 7 8 9];
valueSet = {'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'};
img_labels = categorical(img_labels,keySet,valueSet);

%Now train data contains the batch data with the data label added as an
%extra columnn

%Split data into validate 

%Now we need to use machine learning thingy...


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
 
options = trainingOptions('sgdm',...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropFactor',0.2,...
    'LearnRateDropPeriod',5,...
    'MaxEpochs',50,...
    'MiniBatchSize',64,...
    'VerboseFrequency',20);

convnet = trainNetwork(img_data,img_labels,layers,options);