%%%%%% MAIN file with all functionality defined as functions

loadIntoWorkspace();

trainSize = 20000;
testSize  = 10000;
testEnd   = min(trainSize+testSize+1,60000);


[net, sucessRateTrainging] = networkTraining(50,cifarData(1:trainSize,:),cifarLabels(1:trainSize,:));
sucessRateTesting = networkTesting(net, cifarData(trainSize+1:testEnd,:), cifarLabels(trainSize+1:testEnd,:));

% for i = 1:10
% 
% [net, sucessRateTraining] = networkTraining(10*i,dataStd(1:trainSize,:),target(1:trainSize,:));
% sucessRateTesting(i) = networkTesting(net,dataStd(trainSize+1:testEnd,:),target(trainSize+1:testEnd,:));
% 
% end

function loadIntoWorkspace()
% loads all the cifar data into the workspace for the MLP network. The
% pixel values also get normalized to the range [0,1].
% Outputs: - cifarData 60000*3072 array containing the image information.
%          - cifarLabels 60000*10 array containging the image labels.

addpath(genpath('cifar-10-batches-mat'));
cifarData = zeros(60000,3072);
cifarLabels = zeros(60000,10);

for i = 1:5
    
    load(strcat('data_batch_',num2str(i)));
    
    for j = 1 : 10000
        cifarData((i-1)*10000+j,:) = data(j,:);
        labelItem = labels(j,1);
        cifarLabels((i-1)*10000+j,labelItem+1) = 1;
    end
    
end

% Normalization to range [0,1]
cifarData = 1/255*cifarData;
assignin('base','cifarData',cifarData);
assignin('base','cifarLabels',cifarLabels);

end

function [net,sucessRateTraining] = networkTraining(numberNeurons,data,target)

    x = data';
    t = target';

%     Choose a Training Function
%     For a list of all training functions type: help nntrain
%     'trainlm' is usually fastest.
%     'trainbr' takes longer but may be better for challenging problems.
%     'trainscg' uses less memory. Suitable in low memory situations.
    trainFcn = 'trainscg';

    net.trainFcn = 'traingdx';

    % Create a Pattern Recognition Network
    hiddenLayerSize = [100 numberNeurons];
    net = patternnet(hiddenLayerSize, trainFcn);


    % Setup Division of Data for Training, Validation, Testing
    net.divideParam.trainRatio = 60/100;
    net.divideParam.valRatio = 20/100;
    net.divideParam.testRatio = 20/100;

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

function sucessRateTesting = networkTesting(net,data,target)

    x = data';
    t = target';
    y = net(x);
    e = gsubtract(t,y);
    tind = vec2ind(t);
    yind = vec2ind(y);
    percentErrors = sum(tind ~= yind)/numel(tind);
    sucessRateTesting = 1- percentErrors

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

%%%% NEURAL PROJECT: read in all the data

% %% show image
% load('cifar-10-batches-mat/data_batch_1.mat');
% image = data(12,:);
% image = reshape(image,[32,32,3]);
% image = rot90(image,3);
% imshow(image);

% generate target matrix

% data = double(data);
% target = zeros(length(labels),10,'double');
% for i = 1:length(labels)
%     correctLabel = labels(i)+1;
%     target(i,correctLabel) = 1;
% end