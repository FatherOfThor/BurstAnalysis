%% False P and False N plot
FalseDetectionsPerSecondSlidingTimeWindow(1)=FalseDetectionsPerSecondSlidingTimeWindow(1)/(1.0-((5*0.1)/1000));
FalseDetectionsPerSecondSlidingTimeWindow(2)=FalseDetectionsPerSecondSlidingTimeWindow(2)/(1.0-((5*0.5)/1000));
FalseDetectionsPerSecondSlidingTimeWindow(3)=FalseDetectionsPerSecondSlidingTimeWindow(3)/(1.0-((5*1)/1000));
FalseDetectionsPerSecondSlidingTimeWindow(4)=FalseDetectionsPerSecondSlidingTimeWindow(4)/(1.0-((5*10)/1000));
FalseDetectionsPerSecondSlidingTimeWindow(5)=FalseDetectionsPerSecondSlidingTimeWindow(5)/(1.0-((5*100)/1000));

FalseDetectionsPerSecondInterphoton(1)=FalseDetectionsPerSecondInterphoton(1)/(1.0-((5*0.1)/1000));
FalseDetectionsPerSecondInterphoton(2)=FalseDetectionsPerSecondInterphoton(2)/(1.0-((5*0.5)/1000));
FalseDetectionsPerSecondInterphoton(3)=FalseDetectionsPerSecondInterphoton(3)/(1.0-((5*1)/1000));
FalseDetectionsPerSecondInterphoton(4)=FalseDetectionsPerSecondInterphoton(4)/(1.0-((5*10)/1000));
FalseDetectionsPerSecondInterphoton(5)=FalseDetectionsPerSecondInterphoton(5)/(1.0-((5*100)/1000));

FalseDetectionsPerSecondChangePoint(1)=FalseDetectionsPerSecondChangePoint(1)/(1.0-((5*0.1)/1000));
FalseDetectionsPerSecondChangePoint(2)=FalseDetectionsPerSecondChangePoint(2)/(1.0-((5*0.5)/1000));
FalseDetectionsPerSecondChangePoint(3)=FalseDetectionsPerSecondChangePoint(3)/(1.0-((5*1)/1000));
FalseDetectionsPerSecondChangePoint(4)=FalseDetectionsPerSecondChangePoint(4)/(1.0-((5*10)/1000));
FalseDetectionsPerSecondChangePoint(5)=FalseDetectionsPerSecondChangePoint(5)/(1.0-((5*100)/1000));

figure()
FigH=figure('Position', get(0,'Screensize'));
sgtitle('Comparison statistical measures 5 minimum photon(s) per burst')
subplot(1,3,1)
xaxis=[.1 .5 1 10 100];
set(gca,'XScale','log', 'YScale', 'log')
hold on
ylim([0 260])
plot(xaxis(:),FalseDetectionsPerSecondSlidingTimeWindow(:),'o-','color',[0, 0.4470, 0.7410],'LineWidth',2)
plot(xaxis(:),FalseDetectionsPerSecondInterphoton(:),'o-','color',[0.8500, 0.3250, 0.0980],'LineWidth',2)
%plot(xaxis(:),FalseDetectionsPerSecondCUSUM(:),'og-','LineWidth',2)
plot(xaxis(:),FalseDetectionsPerSecondChangePoint(:),'o-','color',[0.4940, 0.1840, 0.5560],'LineWidth',2)

plot(xaxis(:),[FalsePositiveRateSlidingTimeWindow5Photon, FalsePositiveRateSlidingTimeWindow5Photon, FalsePositiveRateSlidingTimeWindow5Photon, FalsePositiveRateSlidingTimeWindow5Photon, FalsePositiveRateSlidingTimeWindow5Photon],':','color',[0, 0.4470, 0.7410],'LineWidth',3)
plot(xaxis(:),[FalsePositiveRateInterphoton5Photon, FalsePositiveRateInterphoton5Photon,FalsePositiveRateInterphoton5Photon,FalsePositiveRateInterphoton5Photon,FalsePositiveRateInterphoton5Photon],':','color',[0.8500, 0.3250, 0.0980],'LineWidth',2)
%plot(xaxis(:),[FalsePositiveRateCUSUM1Photon, FalsePositiveRateCUSUM1Photon,FalsePositiveRateCUSUM1Photon,FalsePositiveRateCUSUM1Photon,FalsePositiveRateCUSUM1Photon],':g','LineWidth',2)
plot(xaxis(:),[FalsePositiveRateChangePoint5Photon, FalsePositiveRateChangePoint5Photon,FalsePositiveRateChangePoint5Photon,FalsePositiveRateChangePoint5Photon,FalsePositiveRateChangePoint5Photon],':','color',[0.4940, 0.1840, 0.5560],'LineWidth',2)
ylabel('False detection rate','FontSize',15)
xlabel('Burst duration in ms','FontSize',15)
legend('Sliding time window', 'Interphoton Time', 'ChangePoint','Expected Sliding Time Window', 'Expected Interphoton Time', 'Expected ChangePoint','Location' ,'northwest','FontSize',12)
title('Normalized False Detection Rate','FontSize',15)

subplot(1,3,2)
hold on
x= categorical({'0.1ms bursts', '0.5ms bursts', '1.0ms bursts', '10.0ms bursts', '100.0ms bursts'});
x= reordercats(x,{'0.1ms bursts', '0.5ms bursts', '1.0ms bursts', '10.0ms bursts', '100.0ms bursts'});
yaxis=[FalsePositiveRateSlidingTimeWindow; FalsePositiveRateInterphoton ;FalsePositiveRateCUSUM; FalsePositiveRateChangePoint]';
bar(x,yaxis)
ylim([0 120])
ylabel('False positive percentage','FontSize',15)
legend('Sliding Time Window', 'Interphoton Time', 'CUSUM', 'ChangePoint','FontSize',15)
title('False Positives','FontSize',15)

subplot(1,3,3)
hold on
x= categorical({'0.1ms bursts', '0.5ms bursts', '1.0ms bursts', '10.0ms bursts', '100.0ms bursts'});
x= reordercats(x,{'0.1ms bursts', '0.5ms bursts', '1.0ms bursts', '10.0ms bursts', '100.0ms bursts'});
yaxis2=[FalseNegativeRateSlidingTimeWindow; FalseNegativeRateInterphoton ;FalseNegativeRateCUSUM; FalseNegativeRateChangePoint]';
bar(x,yaxis2)
ylim([0 120])
ylabel('False negative percentage','FontSize',15)
legend('Sliding Time Window', 'Interphoton Time', 'CUSUM','ChangePoint','FontSize',15)
title('False Negatives','FontSize',15)
