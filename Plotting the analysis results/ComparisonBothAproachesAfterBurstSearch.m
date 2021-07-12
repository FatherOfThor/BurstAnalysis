%% Photon comparison approach 1 and 2
figure()
%sgtitle('Comparison of photon deviation between simulated and detected photons with dt and binomial approach')
subplot(1,3,1)
edges=-6.5:1:6.5;
h_1=histcounts(SlidingTimeWindowPhotonStartApproach2{1,1},edges);
h_2=histcounts(SlidingTimeWindowPhotonEndApproach2{1,1},edges);
x=edges(1:end-1);

histogram(SlidingTimeWindowPhotonStart{1,1},'facecolor','b','facealpha',.2,'edgealpha',.2, 'edgecolor','none')
hold on
histogram(SlidingTimeWindowPhotonEnd{1,1},'facecolor','r','facealpha',.2,'edgealpha',.2,'edgecolor','none');
stairs(x,h_1,'--b','LineWidth',2)
stairs(x,h_2,'--r','LineWidth',3)
title('Sliding Time Window 1ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylabel('Number of counts','FontSize',12)
xlim([-6 , 6])
ylim([0,4500])
%legend('dt start', 'dt end', 'binomial start', 'binomial end','Location', 'northeast')
    

subplot(1,3,2)
edges=-6.5:1:6.5;
h_1=histcounts(SlidingTimeWindowPhotonStartApproach2{1,2},edges);
h_2=histcounts(SlidingTimeWindowPhotonEndApproach2{1,2},edges);
x=edges(1:end-1);

histogram(SlidingTimeWindowPhotonStart{1,2},'facecolor','b','facealpha',.2,'edgealpha',.2, 'edgecolor','none')
hold on
histogram(SlidingTimeWindowPhotonEnd{1,2},'facecolor','r','facealpha',.2,'edgealpha',.2,'edgecolor','none');
stairs(x,h_1,'--b','LineWidth',2)
stairs(x,h_2,'--r','LineWidth',3)
title('Sliding Time Window 10ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylabel('Number of counts','FontSize',12)
xlim([-6 , 6])
ylim([0,4500])
%legend('dt start', 'dt end', 'binomial start', 'binomial end','Location', 'northeast')

subplot(1,3,3)
edges=-6.5:1:6.5;
h_1=histcounts(SlidingTimeWindowPhotonStartApproach2{1,3},edges);
h_2=histcounts(SlidingTimeWindowPhotonEndApproach2{1,3},edges);
x=edges(1:end-1);

histogram(SlidingTimeWindowPhotonStart{1,3},'facecolor','b','facealpha',.2,'edgealpha',.2, 'edgecolor','none')
hold on
histogram(SlidingTimeWindowPhotonEnd{1,3},'facecolor','r','facealpha',.2,'edgealpha',.2,'edgecolor','none');
stairs(x,h_1,'--b','LineWidth',2)
stairs(x,h_2,'--r','LineWidth',3)
title('Sliding Time Window 100ms burst','FontSize',12)
xlabel('Deviation in photons','FontSize',12)
ylabel('Number of counts','FontSize',12)
xlim([-6 , 6])
ylim([0,4500])
legend('Gillespie start deviation', 'Gillespie end deviation', 'Discrete Time start deviation', 'Discrete Time end deviation','Location', 'northeast','FontSize',12)
