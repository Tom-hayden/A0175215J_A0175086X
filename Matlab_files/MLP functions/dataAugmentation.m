function [augData, augLabels] = dataAugmentation(dataSet,dataLabels,trainSize,onlyFlip)
% augments the data by flipping and rotating it.

imgData = zeros(32,32,3,trainSize);

for i = 1:trainSize
    imgData(:,:,:,i) = rot90(reshape(dataSet(i,:),[32,32,3]),3);
end

% increase dataLabels to 8 times the size.
if(onlyFlip)
    augLabels = [dataLabels; dataLabels];
else
    augLabels = dataLabels;
    for i = 1:7
        augLabels = [augLabels; dataLabels];
    end
end

% Allocate memory and assign first two batches to original and flipped
% around y-axis version of data.
if(onlyFlip)
    augData = zeros(2*trainSize,3072);
    imgDataFlipped = flip(imgData,2);
    rotDataFirst = zeros(2*trainSize,3072);
    for j = 1:trainSize
        rotDataFirst(j,:) = reshape(rot90(imgData(:,:,:,j),-3),[1,3072]);
        rotDataFirst(trainSize+j,:) = reshape(rot90(imgDataFlipped(:,:,:,j),-3),[1,3072]);
    end
    augData(1:2*trainSize,:) = rotDataFirst;
else
    %Mirror and rotate.
    augData = zeros(8*trainSize,3072);
    imgDataFlipped = flip(imgData,2);
    rotDataFirst = zeros(2*trainSize,3072);
    for j = 1:trainSize
        rotDataFirst(j,:) = reshape(rot90(imgData(:,:,:,j),-3),[1,3072]);
        rotDataFirst(trainSize+j,:) = reshape(rot90(imgDataFlipped(:,:,:,j),-3),[1,3072]);
    end
    augData(1:2*trainSize,:) = rotDataFirst;
    for i = 1:3
        rotDataSecond = zeros(2*trainSize,3072);
        imgDataRot = rot90(imgData,i);
        imgDataFlippedRot = rot90(imgDataFlipped,i);
        for j = 1:trainSize
            rotDataSecond(j,:) = reshape(rot90(imgDataRot(:,:,:,j),-3),[1,3072]);
            rotDataSecond(trainSize+j,:) = reshape(rot90(imgDataFlippedRot(:,:,:,j),-3),[1,3072]);
        end
        entry = 2*trainSize+2*(i-1)*trainSize;
        augData(entry+1:entry+2*trainSize,:) = rotDataSecond;
    end
end
end