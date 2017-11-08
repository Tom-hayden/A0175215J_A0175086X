function dataAquisition()
% loads all the cifar data into the workspace for the MLP network. The last
% 10000 rows of the array represent the test data.
%
% Outputs: - cifarData 60000*3072 array containing the image information.
%          - cifarLabels 60000*10 array containging the image labels.

addpath(genpath('../cifar-10-batches-mat'))
cifarData = zeros(60000,3072);
cifarLabels = zeros(60000,10);

% load training data
for i = 1:5
    load(strcat('data_batch_',num2str(i)));
    for j = 1 : 10000
        cifarData((i-1)*10000+j,:) = data(j,:);
        labelItem = labels(j,1);
        cifarLabels((i-1)*10000+j,labelItem+1) = 1;
    end
end

% load test data
load('test_batch');
for j = 1 : 10000
    cifarData(50000+j,:) = data(j,:);
    labelItem = labels(j,1);
    cifarLabels(50000+j,labelItem+1) = 1;
end

% save variables in workspace
assignin('base','cifarData',cifarData);
assignin('base','cifarLabels',cifarLabels);
end