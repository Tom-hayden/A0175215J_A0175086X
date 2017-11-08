% This file plots all the plots for import to latex.
% Mario Gini, Tom Hayden

% Load all the stupid data.

% This uses default settings and varied the training batch size from 10k to
% 50k. Data is preprocessed normally.
load('../MLP functions/SavedNets/5000inc_5repeats_3layers_100_50_eq_norm_default');

% Average over the 5 runs. Compute std as well.

avgSuccessRateTesting = mean(sucessRateTesting,2);
stdSuccessRateTesting = std(sucessRateTesting,0,2);

xAxis = [1:length(avgSuccessRateTesting)];

% Prepare figure

x0 = 3;
y0 = 3;
height = 5;
width = 1.67*height;



figure('Units','centimeters','Position',[x0 y0 width height],'PaperPositionMode','auto');

plot(xAxis,avgSuccessRateTesting);

ylabel({'$y(t)$'},'FontUnits','points','interpreter','latex','FontSize',9,'FontName','Times')
xlabel('Time(s)','FontUnits','points','FontWeight','normal','FontSize',7,'FontName','Times')

% This uses default settings and varies the training batch size from 10k to
% 50k while using image mirroring. Data is preprocessed normally.
%load('../MLP functions/SavedNets/5000inc_5repeats_3layers_100_50_eq_norm_default_mirror');