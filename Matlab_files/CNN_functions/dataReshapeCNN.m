function [Data_CNN, Labels_CNN] = dataReshapeCNN(Data_cpy, Labels_cpy)

sizeTrain = length(Data_cpy);

Data_CNN = zeros(32,32,3,sizeTrain);
Labels_CNN = zeros(sizeTrain,1);


%This line is really silly
for i = 1 :sizeTrain
    for j = 0 : 9
        if Labels_cpy(i,j+1) == 1
            break
        end
    end
    Labels_CNN(i) = j;
end

% Nbatches = 3;
% 
% %Preallocating Validate and train.
% img_data = uint8(zeros(32,32,3,10000*Nbatches));
% img_labels = uint8(zeros(10000*Nbatches,1));
% 
for i = 1:sizeTrain
    Data_CNN(:,:,:,i) = rot90(reshape(Data_cpy(j,:),[32,32,3]),3);
end


%Now create categorical vector of labels.
keySet = [0 1 2 3 4 5 6 7 8 9];
valueSet = {'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'};
Labels_CNN = categorical(Labels_CNN,keySet,valueSet);


end