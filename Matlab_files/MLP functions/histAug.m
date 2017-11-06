function [augData] = histAug(Data)

%Preallocating output
augData = zeros(size(Data,1),size(Data,2)+3);

for i = 1 : size(Data,1)
    augData(i,1:1024) = histeq(uint8(Data(i,1:1024)));
    augData(i,1025:2048) = histeq(Data(i,1025:2048));
    augData(i,2049:3072) = histeq(Data(i,2049:3072));

    augData(i,3073:3075) = [mean(Data(i,1:1024)) mean(Data(i,1025:2048))...
        mean(Data(i,2049:3072))];
end


end