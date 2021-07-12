%% Photon Distributions plot
%load('NumPhotonDeviations.mat')
figure()
FigH=figure('Position', get(0,'Screensize'));
sgtitle('Overview of the distributions of start/end photon deviations for varying algorithms')
subplot(3,4,1)
edges=-15.5:1:15.5;
histogram(SlidingTimeWindowPhotonStart{1,1},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(SlidingTimeWindowPhotonEnd{1,1},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Sliding Time Window 1ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12')


subplot(3,4,5)
edges=-15.5:1:15.5;
histogram(SlidingTimeWindowPhotonStart{1,2},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(SlidingTimeWindowPhotonEnd{1,2},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Sliding Time Window 10ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)

subplot(3,4,9)
edges=-15.5:1:15.5;
histogram(SlidingTimeWindowPhotonStart{1,3},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(SlidingTimeWindowPhotonEnd{1,3},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Sliding Time Window 100ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)


subplot(3,4,2)
edges=-15.5:1:15.5;
histogram(InterphotonPhotonStart{1,1},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(InterphotonPhotonEnd{1,1},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Interphoton 1ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylim([0,3500])

subplot(3,4,6)
edges=-15.5:1:15.5;
histogram(InterphotonPhotonStart{1,2},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(InterphotonPhotonEnd{1,2},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Interphoton 10ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylim([0,3500])

subplot(3,4,10)
edges=-15.5:1:15.5;
histogram(InterphotonPhotonStart{1,3},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(InterphotonPhotonEnd{1,3},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('Interphoton 100ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylim([0,3500])


subplot(3,4,3)
edges=-15.5:1:15.5;
histogram(CUSUMPhotonStart{1,1},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(CUSUMPhotonEnd{1,1},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('CUSUM 1ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylim([0,3000])

subplot(3,4,7)
edges=-15.5:1:15.5;
histogram(CUSUMPhotonStart{1,2},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(CUSUMPhotonEnd{1,2},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('CUSUM 10ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylim([0,3000])

subplot(3,4,11)
edges=-15.5:1:15.5;
histogram(CUSUMPhotonStart{1,3},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(CUSUMPhotonEnd{1,3},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('CUSUM 100ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylim([0,3000])


subplot(3,4,4)
edges=-15.5:1:15.5;
histogram(ChangePointPhotonStart{1,1},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(ChangePointPhotonEnd{1,1},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('ChangePoint 1ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylim([0,4000])

subplot(3,4,8)
edges=-15.5:1:15.5;
histogram(ChangePointPhotonStart{1,2},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(ChangePointPhotonEnd{1,2},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('ChangePoint 10ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylim([0,4000])

subplot(3,4,12)
edges=-15.5:1:15.5;
histogram(ChangePointPhotonStart{1,3},edges,'facecolor','b','facealpha',.5,'edgealpha',.5, 'edgecolor','none')
hold on
histogram(ChangePointPhotonEnd{1,3},edges,'facecolor','r','facealpha',.5,'edgealpha',.5,'edgecolor','none');
title('ChangePoint 100ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
legend('Start of bursts deviation','End of bursts deviation','FontSize',15) 
ylim([0,4000])

fig=gcf;
fig.Position(3)=fig.Position(3);

Lgnd=legend('show');
Lgnd.Position(1)=.740;
Lgnd.Position(2)=.927;
%saveas(FigH,'Photon Distributions of Algorithms.png','png');