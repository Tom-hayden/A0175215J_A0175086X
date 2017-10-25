%Script to test accuracy of model.

load('test_batch.mat')

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
for i = 1:10000
    if predictions(i) == test_labels(i)
        count = count +1;
    end
end

Accuracy = count/10000

