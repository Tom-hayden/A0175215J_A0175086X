function [Data_CNN, Labels_CNN, Test_CNN] = dataReshapeCNN(Data_cpy, Labels_cpy, test_cpy)

sizeTrain = length(Data_cpy);

Data_CNN = zeros(32,32,3,sizeTrain);
Labels_CNN = zeros(sizeTrain,1);
Test_CNN = zeros(32,32,2,10000);

% Nbatches = 3;
% 
% %Preallocating Validate and train.
% img_data = uint8(zeros(32,32,3,10000*Nbatches));
% img_labels = uint8(zeros(10000*Nbatches,1));
% 
% for i = 1:Nbatches
%     load(strcat('data_batch_',num2str(i)))
%     for j = 1 : 10000
%         img_data(:,:,:,(i-1)*10000 +j) = rot90(reshape(data(j,:),[32,32,3]),3);
%     end
%    img_labels((i-1)*10000+1:i*10000) = labels;
% end


%Now create categorical vector of labels.
keySet = [0 1 2 3 4 5 6 7 8 9];
valueSet = {'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'};
img_labels = categorical(Labels_cpy,keySet,valueSet);


end