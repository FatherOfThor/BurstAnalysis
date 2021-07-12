%% Mean Photon deviations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the data used gets reshaped thus only run the script once on saved data,
%then load the saved data again to replot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:3
    MeanPhotonStartDeviationSlidingTimeWindow(i)=mean(SlidingTimeWindowPhotonStart{i});
    Error1(i)=std(SlidingTimeWindowPhotonStart{i});
    MeanPhotonStartDeviationInterphoton(i)=mean(InterphotonPhotonStart{i});
    Error2(i)=std(InterphotonPhotonStart{i});
    MeanPhotonStartDeviationCUSUM(i)=mean(CUSUMPhotonStart{i});
    Error3(i)=std(CUSUMPhotonStart{i}));
    MeanPhotonStartDeviationChangePoint(i)=mean(ChangePointPhotonStart{i});
    Error4(i)=std(ChangePointPhotonStart{i});
    
    MeanPhotonEndDeviationSlidingTimeWindow(i)=mean(SlidingTimeWindowPhotonEnd{i});
    Error5(i)=std(SlidingTimeWindowPhotonEnd{i});
    MeanPhotonEndDeviationInterphoton(i)=mean(InterphotonPhotonEnd{i});
    Error6(i)=std(InterphotonPhotonEnd{i});
    MeanPhotonEndDeviationCUSUM(i)=mean(CUSUMPhotonEnd{i});
    Error7(i)=std(CUSUMPhotonEnd{i});
    MeanPhotonEndDeviationChangePoint(i)=mean(ChangePointPhotonEnd{i}); 
    Error8(i)=std(ChangePointPhotonEnd{i});
end

xaxis=[1 10 100];
figure()
FigH=figure('Position', get(0,'Screensize'));

%sgtitle('Mean Photon Start/End Deviations for Varying Burst Durations','FontSize', 15)
subplot(1,2,1)
set(gca,'XScale','log', 'YScale', 'linear')
hold on;
grid on;
errorbar(xaxis(:),MeanPhotonStartDeviationSlidingTimeWindow(:),Error1(:), 'o-', 'LineWidth',2)
errorbar(xaxis(:),MeanPhotonStartDeviationInterphoton(:),Error2(:), 'o-', 'LineWidth',2)
errorbar(xaxis(:),MeanPhotonStartDeviationCUSUM(:),Error3(:), 'o-', 'LineWidth',2)
errorbar(xaxis(:),MeanPhotonStartDeviationChangePoint(:),Error4(:), 'o-', 'LineWidth',2)
semilogx(xaxis(:),[ 0 0 0 ],':', 'LineWidth',2)
xlabel('Burst duration in ms', 'FontSize', 15)
ylabel('Mean photon start deviation in photons','FontSize',15)
ylim([-10 10])
legend('Sliding Time Window', 'Interphoton', 'CUSUM', 'ChangePoint','Ideal Scenario', 'FontSize',15,'Location', 'northwest')


subplot(1,2,2)
set(gca,'XScale','log', 'YScale', 'linear')
hold on;
errorbar(xaxis(:),MeanPhotonEndDeviationSlidingTimeWindow(:),Error5(:), 'o-', 'LineWidth',2)
errorbar(xaxis(:),MeanPhotonEndDeviationInterphoton(:),Error6(:), 'o-', 'LineWidth',2)
errorbar(xaxis(:),MeanPhotonEndDeviationCUSUM(:),Error7(:), 'o-', 'LineWidth',2)
errorbar(xaxis(:),MeanPhotonEndDeviationChangePoint(:),Error8(:), 'o-', 'LineWidth',2)
plot(xaxis(:),[ 0 0 0 ],':', 'LineWidth',2)
grid on;
ylim([-10 10])
xlabel('Burst duration in ms', 'FontSize', 15)
ylabel('Mean photon end deviation in photons','FontSize',15)
legend('Sliding Time Window', 'Interphoton', 'CUSUM', 'ChangePoint','Ideal Scenario', 'FontSize',15,'Location', 'northwest')

