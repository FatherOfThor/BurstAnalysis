%% Distributions plot
%load('PlotDistributions.mat')
figure()
FigH=figure('Position', get(0,'Screensize'));
sgtitle('Overview of the distributions of start/end deviations for varying algorithms')

subplot(3,4,1)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartSlidingTimeWindow{1,1},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndSlidingTimeWindow{1,1},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Sliding Time Window 1ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0,4000])
%legend('Start of bursts error','End of bursts error')

subplot(3,4,5)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartSlidingTimeWindow{1,2},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndSlidingTimeWindow{1,2},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Sliding Time Window 10ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0,4000])

%legend('Start of bursts error','End of bursts error') 

subplot(3,4,9)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartSlidingTimeWindow{1,3},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndSlidingTimeWindow{1,3},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Sliding Time Window 100ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0,4000])
%legend('Start of bursts error','End of bursts error') 

subplot(3,4,2)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartInterphoton{1,1},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndInterphoton{1,1},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Interphoton 1ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0 , 3500])
%legend('Start of bursts error','End of bursts error') 

subplot(3,4,6)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartInterphoton{1,2},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndInterphoton{1,2},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Interphoton 10ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0 , 3500])
%legend('Start of bursts error','End of bursts error') 

subplot(3,4,10)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartInterphoton{1,3},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndInterphoton{1,3},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Interphoton 100ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0 , 3500])
%legend('Start of bursts error','End of bursts error') 

subplot(3,4,3)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartCUSUM{1,1},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndCUSUM{1,1},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('CUSUM 1ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0 , 1000])
%legend('Start of bursts error','End of bursts error') 

subplot(3,4,7)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartCUSUM{1,2},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndCUSUM{1,2},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('CUSUM 10ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0 , 1000])
%legend('Start of bursts error','End of bursts error') 

subplot(3,4,11)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartCUSUM{1,3},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndCUSUM{1,3},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('CUSUM 100ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0 , 1000])

subplot(3,4,4)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartChangePoint{1,1},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndChangePoint{1,1},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Change Point 1ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0,4000])

subplot(3,4,8)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartChangePoint{1,2},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndChangePoint{1,2},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Change Point 10ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0,4000])

subplot(3,4,12)
edges=-2.025:0.05:2.025;
histogram(PlotDistributionStartChangePoint{1,3},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(PlotDistributionEndChangePoint{1,3},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Change Point 100ms burst','FontSize',12)
xlabel('Deviation in ms','FontSize',12)
ylim([0,4000])
legend('Start of bursts deviation','End of bursts deviation','FontSize',15) 

fig=gcf;
fig.Position(3)=fig.Position(3);

Lgnd=legend('show');
Lgnd.Position(1)=.715;
Lgnd.Position(2)=.927;
%saveas(FigH,'Distributions of Algorithms.png','png');