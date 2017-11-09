function [net,sucessRateTraining] = networkTraining(data,target,options)
% defines and trains a MLP classifier.

%Find some params.
trainFcn = options.trainFcn;
origSize = options.trainsize;
totalSize = size(target,2);

RandIndx = randperm(origSize);
data(1:origSize,:)= data(RandIndx,:);
target(1:origSize,:) = target(RandIndx,:);

data = data';
target = target';

% Create a Pattern Recognition Network
hiddenLayerSize = options.layers;
net = patternnet(hiddenLayerSize, trainFcn);

% Change the type of activation function

net.layers{1}.transferFcn = options.transferFcn;
net.layers{2}.transferFcn = options.transferFcn;


% Setup Division of Data for Training, Validation, Testing. No need for
% test data since we test the model separately after training.
net.divideFcn = 'divideblock';
net.divideParam.trainRatio = 80/10;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 0/100;

% Performance function
net.performFcn = 'crossentropy';

% Learning rate.
net.layerWeights{2,1}.LearnParam.lr = options.learningRate;
net.layerWeights{3,2}.LearnParam.lr = options.learningRate;

% Train the Network

[net,tr] = train(net,data,target);

% Test the Network
y = net(data);
e = gsubtract(target,y);
%  performance = perform(net,t,y)
tind = vec2ind(target);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);

sucessRateTraining = 1- percentErrors

end