%% splitting frequency
figure()

FigH=figure('Position', get(0,'Screensize'));
sgtitle('Comparison of splitting frequency per algorithm for varying burst durations with 5 minimum photon(s) per burst')
subplot(3,4,1)
bins=.9:.2:2.1;
histogram(SplittingFrequencySlidingTimeWindow{1,3},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('Sliding Time Window 1ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,5)
bins=.9:.2:5.1;
histogram(SplittingFrequencySlidingTimeWindow{1,4},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('Sliding Time Window 10ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,9)
bins=.9:.2:10.1;
histogram(SplittingFrequencySlidingTimeWindow{1,5},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('Sliding Time Window 100ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,2)
bins=.9:.2:2.1;
histogram(SplittingFrequencyInterphoton{1,3},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('Interphoton 1ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')
ylim([0 1000])

subplot(3,4,6)
bins=.9:.2:2.1;
histogram(SplittingFrequencyInterphoton{1,4},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('Interphoton 10ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,10)
bins=.9:.2:2.1;
histogram(SplittingFrequencyInterphoton{1,5},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('Interphoton 100ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,3)
bins=.9:.2:2.1;
histogram(SplittingFrequencyCUSUM{1,3},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('CUSUM 1ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,7)
bins=.9:.2:2.1;
histogram(SplittingFrequencyCUSUM{1,4},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('CUSUM 10ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,11)
bins=.9:.2:2.1;
histogram(SplittingFrequencyCUSUM{1,5},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('CUSUM 100ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,4)
bins=.9:.2:2.1;
histogram(SplittingFrequencyChangePoint{1,3},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('ChangePoint 1ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,8)
bins=.9:.2:2.1;
histogram(SplittingFrequencyChangePoint{1,4},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('ChangePoint 10ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')

subplot(3,4,12)
bins=.9:.2:2.1;
histogram(SplittingFrequencyChangePoint{1,5},bins,'facecolor','b','facealpha',1,'edgealpha',.2, 'edgecolor','none')

title('ChangePoint 100ms burst')
xlabel('Splitting frequency per burst')
ylabel('Number of simulations')