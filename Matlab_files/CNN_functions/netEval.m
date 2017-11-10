%Script to test accuracy of model.
% Mario Gini, Tom Hayden

load('../cifar-10-batches-mat/test_batch.mat')

test_data = uint8(zeros(32,32,3,10000));
test_labels = labels;

for i = 1:10000
    test_data(:,:,:,i) = rot90(reshape(data(i,:),[32,32,3]),3);
end

keySet = [0 1 2 3 4 5 6 7 8 9];
valueSet = {'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'};
test_labels = categorical(test_labels,keySet,valueSet);

predictions = classify(convnet,test_data);

count = 0;

predictionOneHot = zeros(10000,10);
test_labelsOneHot = zeros(10000,10);

test_LabelsDigits = grp2idx(test_labels);
predictionsDigits = grp2idx(predictions);

for i = 1:10000
    value1 = test_LabelsDigits(i);
    test_labelsOneHot(i,value1) = 1;
    value2 = predictionsDigits(i);
    predictionOneHot(i,value2) = 1;
    
    if predictions(i) == test_labels(i)
        count = count +1;
        
    end
end

SuccessRateTesting = count/100

%plot confusion matrix for CNN

plotconfusion(test_labelsOneHot',predictionOneHot');

