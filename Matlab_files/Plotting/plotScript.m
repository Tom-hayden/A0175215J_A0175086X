% This file plots all the plots for import to latex.
% Mario Gini, Tom Hayden

% Figure about varying test batch size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %This uses default settings and varied the training batch size from 10k to
% %50k. Data is preprocessed normally. Average over the 5 runs. Compute std as well.
% load('../MLP functions/SavedNets/5000inc_5repeats_3layers_100_50_eq_norm_default');
% avgSuccessRateTesting1 = mean(sucessRateTesting,2);
% stdSuccessRateTesting1 = std(sucessRateTesting,0,2);
% xAxis = [10:5:5*(length(avgSuccessRateTesting1)+1)];
% 
% %just to be sure since these variable are newly loaded.
% clear sucessRateTesting trainTime;
% 
% %This uses default settings and varies the training batch size from 10k to
% %50k while using image mirroring. Data is preprocessed normally. Average over the 5 runs. Compute std as well.
% load('../MLP functions/SavedNets/5000inc_5repeats_3layers_100_50_eq_norm_default_mirror');
% avgSuccessRateTesting2 = mean(sucessRateTesting,2);
% stdSuccessRateTesting2 = std(sucessRateTesting,0,2);
% 
% %Set up figure
% width = 15.99532; % this value is from latex dont change
% height = width*0.61803398875; % we use the golden ratio for maximum aestetics
% 
% figure;
% 
% plot(xAxis,100*avgSuccessRateTesting2,xAxis,100*avgSuccessRateTesting1);
% 
% % specify axis limits
% xMin = 10;
% xMax = xAxis(end);
% yMin = 40;
% yMax = 54;
% axis([xMin xMax yMin yMax]);
% 
% set(gca,'YTick',yMin:2:yMax,'XTick',xMin:5:xMax,'TickLabelInterpreter','latex');
% ylabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
% xlabel({'Training Batch Size \lbrack *1000\rbrack'},'interpreter','latex');
% title({'Test Accuracy for Varying Training Batch Size'},'interpreter','latex');
% legend({'Data Augmentation','No Data Augmentation'},'interpreter','latex');
% 
% %this directly saves the .eps into the latex folder
% print('-depsc2','../../Latex_files/images/dataAugmentation.eps');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % figure with varying layers
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % load data. Average over the 5 runs. 20k test batches are used with 50
% % nodes and a varying number of layers from 1 to 5.
% load('../MLP functions/SavedNets/20ktest_noAug_50nodes_1to5layers')
% avgSuccessRateTesting3 = mean(sucessRateTesting,2);
% stdSuccessRateTesting3 = std(sucessRateTesting,0,2);
% xAxis2 = [1:length(avgSuccessRateTesting3)];
% 
% % just to be sure since these variable are newly loaded.
% clear sucessRateTesting trainTime;
% 
% % Set up figure
% width = 15.99532; % this value is from latex dont change
% height = width*0.61803398875; % we use the golden ratio for maximum aestetics
% 
% figure();
% 
% plot(xAxis2,100*avgSuccessRateTesting3);
% 
% % specify axis limits
% xMin = 1;
% xMax = xAxis2(end);
% yMin = 40;
% yMax = 46;
% axis([xMin xMax yMin yMax])
% 
% set(gca,'YTick',yMin:2:yMax,'XTick',xMin:1:xMax,'TickLabelInterpreter','latex');
% ylabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
% xlabel({'Number of Layers \lbrack-\rbrack'},'interpreter','latex');
% title({'Test Accuracy for Varying Number of Layers'},'interpreter','latex');
% legend({'20k test batch size, no data augmentation'},'interpreter','latex');
% 
% %this directly saves the .eps into the latex folder
% print('-depsc2','../../Latex_files/images/numberLayers.eps');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure with a fancy surface
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load data. Average over the 5 runs. 20k test batches are used both first
% and second layer varying from 10 to 100 nodes
load('../MLP functions/SavedNets/layers_10_to_100');
avgSuccessRateTesting4 = mean(sucessRateTesting,3);
stdSuccessRateTesting4 = std(sucessRateTesting,0,3);

% just to be sure since these variable are newly loaded.
clear sucessRateTesting trainTime;

% Set up figure
width = 15.99532; % this value is from latex dont change
height = width*0.61803398875; % we use the golden ratio for maximum aestetics

figure();

% plot surface

[X, Y] = meshgrid(10:10:90,10:10:90);
surf(X,Y,100*avgSuccessRateTesting4);

set(gca,'YTick',10:10:100,'XTick',10:10:100,'TickLabelInterpreter','latex');
ylabel({'Neurons in first layer \lbrack\-\rbrack'},'interpreter','latex');
xlabel({'Neurons in second layer \lbrack\-\rbrack'},'interpreter','latex');
zlabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
title({'Test Accuracy for Varying Number of Layers'},'interpreter','latex');

hLabel = get(gca,'XLabel'); 
set(hLabel, 'Position', get(hLabel, 'Position') - [-20 -10 0]); 
set(hLabel, 'Units', 'pixels');
set(get(gca,'XLabel'),'rotation',12);

hLabel = get(gca,'YLabel'); 
set(hLabel, 'Position', get(hLabel, 'Position') - [-20 -40 0]); 
set(hLabel, 'Units', 'pixels');
set(get(gca,'YLabel'),'rotation',-24);


%this directly saves the .eps into the latex folder
%print('-depsc2','../../Latex_files/images/surfaceLayers.eps');

