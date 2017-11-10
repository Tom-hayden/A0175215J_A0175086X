function plotConf(Targ, Res)
%Function to plot confusion matrix.

%Preallocate output.
output = zeros(10000,10);

%Convert to one-hot
for i = 1 :10000
    [~, indx] = max(Res(:,i));
    output(i,indx) = 1;
end

plotconfusion(Targ,output')