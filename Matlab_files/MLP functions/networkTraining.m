function [net,sucessRateTraining] = networkTraining(data,target,options)
% defines and trains a MLP classifier.

x = data';
t = target';

trainFcn = options.trainFcn;


% Create a Pattern Recognition Network
hiddenLayerSize = options.layers;
net = patternnet(hiddenLayerSize, trainFcn);


% Setup Division of Data for Training, Validation, Testing. No need for
% test data since we test the model separately after training.
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 0/100;

% Performance function
net.performFcn = 'crossentropy';

% Train the Network

[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
%  performance = perform(net,t,y)
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);

sucessRateTraining = 1- percentErrors

end