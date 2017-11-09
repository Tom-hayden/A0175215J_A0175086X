% 
% 
% options.trainsize = 10000;       %value between 1 and 50000
% options.preprocessing = 'none'; %valid values are 'none' and 'all'
% options.augmentation = 'all';
% options.trainFcn =  'trainscg';
% options.layers = [100 50];
% options.performFcn = 'crossentropy'; % many valid options
% 
% 
% %First aquire all data. This should not be changed.
% dataAquisition();
% 
% [Data_cpy, Labels_cpy, test_cpy] = dataPreProcAndAug(cifarData,cifarLabels,options);

Img = Data_cpy(999,:);
image = uint8(reshape(Img,[32,32,3]));
image = rot90(image,3);
I = image;
for i = 0:7
Img = Data_cpy(999+10000*i,:);
image = uint8(reshape(Img,[32,32,3]));
image = rot90(image,3);
I = image;
subplot(2,4,i+1)
imshow(I);
end


