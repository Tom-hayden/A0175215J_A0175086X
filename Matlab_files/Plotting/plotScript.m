% % This file plots all the plots for import to latex.
% % Mario Gini, Tom Hayden
% 
% % Figure about varying test batch size
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
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
<<<<<<< HEAD
% figure;
% 
% plot(xAxis,100*avgSuccessRateTesting2,xAxis,100*avgSuccessRateTesting1);
% 
% % specify axis limits
% xMin = 10;
% xMax = xAxis(end);
% yMin = 40;
% yMax = 54;
=======
% figure('Units', 'Centimeters','position', [5, 5, width, height]);
% 
% 
% errorbar(xAxis, 100*avgSuccessRateTesting2,100*stdSuccessRateTesting2);
% hold on;
% plot(xAxis,100*avgSuccessRateTesting1);
% 
% % specify axis limits
% xMin = 5;
% xMax = xAxis(end)+5;
% yMin = 39;
% yMax = 53;
>>>>>>> 7edc1523344e8feb9f21997e8d3461b32f991bb9
% axis([xMin xMax yMin yMax]);
% 
% set(gca,'YTick',yMin:2:yMax,'XTick',xMin:5:xMax,'TickLabelInterpreter','latex');
% ylabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
% xlabel({'Training Batch Size \lbrack *1000\rbrack'},'interpreter','latex');
% title({'Test Accuracy for Varying Training Batch Size'},'interpreter','latex');
<<<<<<< HEAD
% legend({'Data Augmentation','No Data Augmentation'},'interpreter','latex');
% 
% %this directly saves the .eps into the latex folder
% print('-depsc2','../../Latex_files/images/dataAugmentation.eps');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % figure with varying layers
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
=======
% legend({'Preprocessing \& Image Mirroring','Only Preprocessing'},'interpreter','latex','location','southeast');
% 
% %this directly saves the .eps into the latex folder
% print('-depsc2','../../Latex_files/images/dataAugmentation.eps');
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % figure with varying layers
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
>>>>>>> 7edc1523344e8feb9f21997e8d3461b32f991bb9
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
<<<<<<< HEAD
% figure();
% 
% plot(xAxis2,100*avgSuccessRateTesting3);
% 
% % specify axis limits
% xMin = 1;
% xMax = xAxis2(end);
% yMin = 40;
=======
% figure('Units', 'Centimeters','position', [5, 5, width, height]);
% 
% errorbar(xAxis2,100*avgSuccessRateTesting3,100*stdSuccessRateTesting3);
% 
% % specify axis limits
% xMin = 0;
% xMax = xAxis2(end)+1;
% yMin = 38;
>>>>>>> 7edc1523344e8feb9f21997e8d3461b32f991bb9
% yMax = 46;
% axis([xMin xMax yMin yMax])
% 
% set(gca,'YTick',yMin:2:yMax,'XTick',xMin:1:xMax,'TickLabelInterpreter','latex');
% ylabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
% xlabel({'Number of Layers \lbrack-\rbrack'},'interpreter','latex');
% title({'Test Accuracy for Varying Number of Layers'},'interpreter','latex');
<<<<<<< HEAD
% legend({'20k test batch size, no data augmentation'},'interpreter','latex');
=======
% legend({'MLP Classifier with Default Settings'},'interpreter','latex','location','southeast');
>>>>>>> 7edc1523344e8feb9f21997e8d3461b32f991bb9
% 
% %this directly saves the .eps into the latex folder
% print('-depsc2','../../Latex_files/images/numberLayers.eps');
% 
<<<<<<< HEAD

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure with 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load data. Average over the 5 runs. 20k test batches are used with 50
% nodes and a varying number of layers from 1 to 5.
load('../MLP functions/SavedNets/LearnRate_0_001_0_01_0_1_1_10_100.mat')
avgSuccessRateTesting3 = mean(sucessRateTesting,2);
stdSuccessRateTesting3 = std(sucessRateTesting,0,2);
xAxis2 = [0.001 0.01 0.1  1 10 100]';

% just to be sure since these variable are newly loaded.
clear sucessRateTesting trainTime;

% Set up figure
width = 15.99532; % this value is from latex dont change
height = width*0.61803398875; % we use the golden ratio for maximum aestetics

figure('pos',[0 0 100*width 100*height]);

semilogx(xAxis2,100*avgSuccessRateTesting3);

% specify axis limits
xMin = 0.001;
xMax = xAxis2(end);
yMin = 40;
yMax = 46;
axis([xMin xMax yMin yMax])

%set(gca,'YTick',yMin:2:yMax,'XTick',xMin:1:xMax,'TickLabelInterpreter','latex');
ylabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
xlabel({'Learning rate'},'interpreter','latex');
title({'Test Accuracy for Varying Learning rate'},'interpreter','latex');
legend({'20k test batch size, no data augmentation'},'interpreter','latex');

%this directly saves the .eps into the latex folder
print('-depsc2','../../Latex_files/images/learningRate.eps');




=======
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %figure with a fancy surface
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % load data. Average over the 5 runs. 20k test batches are used both first
% % and second layer varying from 10 to 100 nodes
% load('../MLP functions/SavedNets/layers_10_to_100');
% avgSuccessRateTesting4 = mean(sucessRateTesting,3);
% stdSuccessRateTesting4 = std(sucessRateTesting,0,3);
% 
% % just to be sure since these variable are newly loaded.
% clear sucessRateTesting trainTime;
% 
% % Set up figure
% width = 15.99532; % this value is from latex dont change
% height = width*0.61803398875; % we use the golden ratio for maximum aestetics
% 
% figure('Units', 'Centimeters','position', [5, 5, width, height]);
% 
% % plot surface
% 
% [X, Y] = meshgrid(10:10:90,10:10:90);
% surf(X,Y,100*avgSuccessRateTesting4);
% 
% set(gca,'YTick',10:10:100,'XTick',10:10:100,'TickLabelInterpreter','latex');
% ylabel({'Neurons in First Layer \lbrack-\rbrack'},'interpreter','latex');
% xlabel({'Neurons in Second Layer \lbrack-\rbrack'},'interpreter','latex');
% zlabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
% title({'Test Accuracy for Varying Number of Layers'},'interpreter','latex');
% 
% hLabel = get(gca,'XLabel'); 
% set(hLabel, 'Position', get(hLabel, 'Position') - [-20 -10 0]); 
% set(hLabel, 'Units', 'pixels');
% set(get(gca,'XLabel'),'rotation',12);
% 
% hLabel = get(gca,'YLabel'); 
% set(hLabel, 'Position', get(hLabel, 'Position') - [-20 -40 0]); 
% set(hLabel, 'Units', 'pixels');
% set(get(gca,'YLabel'),'rotation',-24);
% 
% % this directly saves the .eps into the latex folder
% print('-depsc2','../../Latex_files/images/surfaceLayers.eps');
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % figure for data preprocessing
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %This uses default settings and varied the training batch size from 10k to
% %50k. Data is preprocessed normally. Average over the 5 runs. Compute std as well.
% load('../MLP functions/SavedNets/5000inc_5repeats_3layers_100_50_eq_norm_default');
% avgSuccessRateTesting5 = mean(sucessRateTesting,2);
% stdSuccessRateTesting5 = std(sucessRateTesting,0,2);
% xAxis = [10:5:5*(length(avgSuccessRateTesting5)+1)];
% 
% %just to be sure since these variable are newly loaded.
% clear sucessRateTesting trainTime;
% 
% %This uses default settings and varies the training batch size from 10k to
% %50k while using image mirroring. Data is preprocessed normally. Average over the 5 runs. Compute std as well.
% load('../MLP functions/SavedNets/noPreproc_noAug_layers_100_50_default');
% avgSuccessRateTesting6 = mean(sucessRateTesting,2);
% stdSuccessRateTesting6 = std(sucessRateTesting,0,2);
% 
% %just to be sure since these variable are newly loaded.
% clear sucessRateTesting trainTime;
% 
% %Set up figure
% width = 15.99532; % this value is from latex dont change
% height = width*0.61803398875; % we use the golden ratio for maximum aestetics
% 
% figure('Units', 'Centimeters','position', [5, 5, width, height]);
% 
% errorbar(xAxis,100*avgSuccessRateTesting5,100*stdSuccessRateTesting5);
% hold on;
% plot(xAxis,100*avgSuccessRateTesting6);
% 
% % specify axis limits
% xMin = 5;
% xMax = xAxis(end)+5;
% yMin = 39;
% yMax = 53;
% axis([xMin xMax yMin yMax]);
% 
% set(gca,'YTick',yMin:2:yMax,'XTick',xMin:5:xMax,'TickLabelInterpreter','latex');
% ylabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
% xlabel({'Training Batch Size \lbrack *1000\rbrack'},'interpreter','latex');
% title({'Test Accuracy for Varying Training Batch Size'},'interpreter','latex');
% legend({'Preprocessing','No Preprocessing'},'interpreter','latex','location','southeast');
% 
% %this directly saves the .eps into the latex folder
% print('-depsc2','../../Latex_files/images/dataPreprocessing.eps');
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % figure for performance functions
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %Default settings with varying performFct. The .mat file already contains
% %the avg and std files.
% load('../MLP functions/SavedNets/20ktest_default_differentPerformFct');
% avgSucessSorted = sort(avgSuccessRateTesting7);
% 
% 
% %just to be sure since these variable are newly loaded.
% clear sucessRateTesting trainTime;
% 
% %Set up figure
% width = 15.99532; % this value is from latex dont change
% height = width*0.61803398875; % we use the golden ratio for maximum aestetics
% 
% figure('Units', 'Centimeters','position', [5, 5, width, height]);
% 
% % specify the axes
% yMin = 35;
% yMax = 45;
% 
% histogram('Categories',performFcn,'BinCounts',100*avgSucessSorted, 'barwidth', 0.5);
% 
% ylim([yMin yMax]);
% set(gca,'YTick',yMin:2:yMax,'TickLabelInterpreter','latex');
% ylabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
% xlabel({'Performance Function'},'interpreter','latex');
% title({'Test Accuracy for Different Performance Functions'},'interpreter','latex');
% 
% % 
% %this directly saves the .eps into the latex folder
% print('-depsc2','../../Latex_files/images/performFct.eps');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure for activation functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Default settings with varying performFct. The .mat file already contains
%the avg and std files.
load('../MLP functions/SavedNets/20ktest_default_differentActivationFct');
avgSuccessRateTesting8 = mean(sucessRateTesting,2);
stdSuccessRateTesting8 = std(sucessRateTesting,0,2);

%just to be sure since these variable are newly loaded.
clear sucessRateTesting trainTime;

%Set up figure
width = 15.99532; % this value is from latex dont change
height = width*0.61803398875; % we use the golden ratio for maximum aestetics

figure('Units', 'Centimeters','position', [5, 5, width, height]);

% specify the axes
yMin = 5;
yMax = 50;

histogram('Categories',transferOptions,'BinCounts',100*avgSuccessRateTesting8, 'barwidth', 0.5,'DisplayOrder','ascend');

ylim([yMin yMax]);
set(gca,'YTick',yMin:5:yMax,'TickLabelInterpreter','latex');
ylabel({'Test Accuracy \lbrack\%\rbrack'},'interpreter','latex');
xlabel({'Performance Function'},'interpreter','latex');
title({'Test Accuracy for Different Activation Functions'},'interpreter','latex');

% 
%this directly saves the .eps into the latex folder
print('-depsc2','../../Latex_files/images/activationFct.eps');
>>>>>>> 7edc1523344e8feb9f21997e8d3461b32f991bb9

