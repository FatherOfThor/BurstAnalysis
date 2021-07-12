%% simulation times comparison both approaches
figure()
FigH=figure('Position', get(0,'Screensize'));

subplot(2,3,1)
edges=0:2E-2:5E-1;
Bursts=[.1 .3 .5 .7 .9]*1000; %ms
BD=1; %ms
s_1=histcounts(StartBurstTimeApproach1{1,1}(:,1)*1000-(Bursts(1)-BD/2),edges);
s_2=histcounts(StartBurstTimeApproach1{1,1}(:,2)*1000-(Bursts(2)-BD/2),edges);
s_3=histcounts(StartBurstTimeApproach1{1,1}(:,3)*1000-(Bursts(3)-BD/2),edges);
s_4=histcounts(StartBurstTimeApproach1{1,1}(:,4)*1000-(Bursts(4)-BD/2),edges);
s_5=histcounts(StartBurstTimeApproach1{1,1}(:,5)*1000-(Bursts(5)-BD/2),edges);

SUMs=s_1+s_2+s_3+s_4+s_5;
Mean_s=SUMs/5;

h_1=histcounts(StartBurstTimeApproach2{1,1}(:,1)*1000-(Bursts(1)-BD/2),edges);
h_2=histcounts(StartBurstTimeApproach2{1,1}(:,2)*1000-(Bursts(2)-BD/2),edges);
h_3=histcounts(StartBurstTimeApproach2{1,1}(:,3)*1000-(Bursts(3)-BD/2),edges);
h_4=histcounts(StartBurstTimeApproach2{1,1}(:,4)*1000-(Bursts(4)-BD/2),edges);
h_5=histcounts(StartBurstTimeApproach2{1,1}(:,5)*1000-(Bursts(5)-BD/2),edges);

SUMh=h_1+h_2+h_3+h_4+h_5;
area= sum(SUMh*2E-2);
Meanh=(SUMh)/area;
x=edges(1:end-1);
exponentmu=1/((12130.6131942527+1000)); %count rate start burst in hz
ex_plot=(exppdf(x/1000,exponentmu));
A=trapz(x,ex_plot);

histogram('BinEdges', edges, 'BinCounts',Mean_s,'Normalization','pdf','facecolor','b','facealpha',.2,'edgealpha',.2, 'edgecolor','none')
hold on
stairs(x,Meanh,':r','LineWidth',2)
plot(x,ex_plot/A,'k','LineWidth',1)
title('1ms Bursts','FontSize',15)
xlabel('Deviation in milliseconds','FontSize',15)
ylabel('Probability Density','FontSize',15)

subplot(2,3,2)
edges=0:2E-2:5E-1;
Bursts=[.1 .3 .5 .7 .9]*1000; %ms
BD=10; %ms
s_1=histcounts(StartBurstTimeApproach1{1,2}(:,1)*1000-(Bursts(1)-BD/2),edges);
s_2=histcounts(StartBurstTimeApproach1{1,2}(:,2)*1000-(Bursts(2)-BD/2),edges);
s_3=histcounts(StartBurstTimeApproach1{1,2}(:,3)*1000-(Bursts(3)-BD/2),edges);
s_4=histcounts(StartBurstTimeApproach1{1,2}(:,4)*1000-(Bursts(4)-BD/2),edges);
s_5=histcounts(StartBurstTimeApproach1{1,2}(:,5)*1000-(Bursts(5)-BD/2),edges);

SUMs=s_1+s_2+s_3+s_4+s_5;
Mean_s=SUMs/5;

h_1=histcounts(StartBurstTimeApproach2{1,2}(:,1)*1000-(Bursts(1)-BD/2),edges);
h_2=histcounts(StartBurstTimeApproach2{1,2}(:,2)*1000-(Bursts(2)-BD/2),edges);
h_3=histcounts(StartBurstTimeApproach2{1,2}(:,3)*1000-(Bursts(3)-BD/2),edges);
h_4=histcounts(StartBurstTimeApproach2{1,2}(:,4)*1000-(Bursts(4)-BD/2),edges);
h_5=histcounts(StartBurstTimeApproach2{1,2}(:,5)*1000-(Bursts(5)-BD/2),edges);

SUMh=h_1+h_2+h_3+h_4+h_5;
area= sum(SUMh*2E-2);
Meanh=(SUMh)/area;
x=edges(1:end-1);
exponentmu=1/((12130.6131942527+1000)); %count rate start burst in hz
ex_plot=(exppdf(x/1000,exponentmu));
A=trapz(x,ex_plot);

histogram('BinEdges', edges, 'BinCounts',Mean_s,'Normalization','pdf','facecolor','b','facealpha',.2,'edgealpha',.2, 'edgecolor','none')
hold on
stairs(x,Meanh,':r','LineWidth',2)
plot(x,ex_plot/A,'k','LineWidth',1)
title('10ms Bursts','FontSize',15)
xlabel('Deviation in milliseconds','FontSize',15)
ylabel('Probability Density','FontSize',15)

subplot(2,3,3)
edges=0:2E-2:5E-1;
Bursts=[.1 .3 .5 .7 .9]*1000; %ms
BD=100; %ms
s_1=histcounts(StartBurstTimeApproach1{1,3}(:,1)*1000-(Bursts(1)-BD/2),edges);
s_2=histcounts(StartBurstTimeApproach1{1,3}(:,2)*1000-(Bursts(2)-BD/2),edges);
s_3=histcounts(StartBurstTimeApproach1{1,3}(:,3)*1000-(Bursts(3)-BD/2),edges);
s_4=histcounts(StartBurstTimeApproach1{1,3}(:,4)*1000-(Bursts(4)-BD/2),edges);
s_5=histcounts(StartBurstTimeApproach1{1,3}(:,5)*1000-(Bursts(5)-BD/2),edges);

SUMs=s_1+s_2+s_3+s_4+s_5;
Mean_s=SUMs/5;

h_1=histcounts(StartBurstTimeApproach2{1,3}(:,1)*1000-(Bursts(1)-BD/2),edges);
h_2=histcounts(StartBurstTimeApproach2{1,3}(:,2)*1000-(Bursts(2)-BD/2),edges);
h_3=histcounts(StartBurstTimeApproach2{1,3}(:,3)*1000-(Bursts(3)-BD/2),edges);
h_4=histcounts(StartBurstTimeApproach2{1,3}(:,4)*1000-(Bursts(4)-BD/2),edges);
h_5=histcounts(StartBurstTimeApproach2{1,3}(:,5)*1000-(Bursts(5)-BD/2),edges);

SUMh=h_1+h_2+h_3+h_4+h_5;
area= sum(SUMh*2E-2);
Meanh=(SUMh)/area;
x=edges(1:end-1);
exponentmu=1/((12130.6131942527+1000)); %count rate start burst in hz
ex_plot=(exppdf(x/1000,exponentmu));
A=trapz(x,ex_plot);

histogram('BinEdges', edges, 'BinCounts',Mean_s,'Normalization','pdf','facecolor','b','facealpha',.2,'edgealpha',.2, 'edgecolor','none')
hold on
stairs(x,Meanh,':r','LineWidth',2)
plot(x,ex_plot/A,'k','LineWidth',1)
title('100ms Bursts','FontSize',15)
xlabel('Deviation in milliseconds','FontSize',15)
ylabel('Probability Density','FontSize',15)

subplot(2,3,4)
edges=-5E-1:2E-2:0;
Bursts=[.1 .3 .5 .7 .9]*1000; %ms
BD=1; %ms
s_1=histcounts(EndBurstTimeApproach1{1,1}(:,1)*1000-(Bursts(1)+BD/2),edges);
s_2=histcounts(EndBurstTimeApproach1{1,1}(:,2)*1000-(Bursts(2)+BD/2),edges);
s_3=histcounts(EndBurstTimeApproach1{1,1}(:,3)*1000-(Bursts(3)+BD/2),edges);
s_4=histcounts(EndBurstTimeApproach1{1,1}(:,4)*1000-(Bursts(4)+BD/2),edges);
s_5=histcounts(EndBurstTimeApproach1{1,1}(:,5)*1000-(Bursts(5)+BD/2),edges);

SUMs=s_1+s_2+s_3+s_4+s_5;
Mean_s=SUMs/5;

h_1=histcounts(EndBurstTimeApproach2{1,1}(:,1)*1000-(Bursts(1)+BD/2),edges);
h_2=histcounts(EndBurstTimeApproach2{1,1}(:,2)*1000-(Bursts(2)+BD/2),edges);
h_3=histcounts(EndBurstTimeApproach2{1,1}(:,3)*1000-(Bursts(3)+BD/2),edges);
h_4=histcounts(EndBurstTimeApproach2{1,1}(:,4)*1000-(Bursts(4)+BD/2),edges);
h_5=histcounts(EndBurstTimeApproach2{1,1}(:,5)*1000-(Bursts(5)+BD/2),edges);

SUMh=h_1+h_2+h_3+h_4+h_5;
area= sum(SUMh*2E-2);
Meanh=(SUMh)/area;
x=edges(1:end-1);
Meanh(26)=Meanh(25);
x(26)=0;
exponentmu=1/((12130.6131942527+1000)); %count rate start burst in hz
ex_plot=(exppdf(-x/1000,exponentmu));
A=trapz(x,ex_plot);

histogram('BinEdges', edges, 'BinCounts',Mean_s,'Normalization','pdf','facecolor','b','facealpha',.2,'edgealpha',.2, 'edgecolor','none')
hold on
stairs(x,Meanh,':r','LineWidth',2)
plot(x,ex_plot/A,'k','LineWidth',1)
title('1ms Bursts','FontSize',15)
xlabel('Deviation in milliseconds','FontSize',15)
ylabel('Probability Density','FontSize',15)

subplot(2,3,5)
edges=-5E-1:2E-2:0;
Bursts=[.1 .3 .5 .7 .9]*1000; %ms
BD=10; %ms
s_1=histcounts(EndBurstTimeApproach1{1,2}(:,1)*1000-(Bursts(1)+BD/2),edges);
s_2=histcounts(EndBurstTimeApproach1{1,2}(:,2)*1000-(Bursts(2)+BD/2),edges);
s_3=histcounts(EndBurstTimeApproach1{1,2}(:,3)*1000-(Bursts(3)+BD/2),edges);
s_4=histcounts(EndBurstTimeApproach1{1,2}(:,4)*1000-(Bursts(4)+BD/2),edges);
s_5=histcounts(EndBurstTimeApproach1{1,2}(:,5)*1000-(Bursts(5)+BD/2),edges);

SUMs=s_1+s_2+s_3+s_4+s_5;
Mean_s=SUMs/5;

h_1=histcounts(EndBurstTimeApproach2{1,2}(:,1)*1000-(Bursts(1)+BD/2),edges);
h_2=histcounts(EndBurstTimeApproach2{1,2}(:,2)*1000-(Bursts(2)+BD/2),edges);
h_3=histcounts(EndBurstTimeApproach2{1,2}(:,3)*1000-(Bursts(3)+BD/2),edges);
h_4=histcounts(EndBurstTimeApproach2{1,2}(:,4)*1000-(Bursts(4)+BD/2),edges);
h_5=histcounts(EndBurstTimeApproach2{1,2}(:,5)*1000-(Bursts(5)+BD/2),edges);

SUMh=h_1+h_2+h_3+h_4+h_5;
area= sum(SUMh*2E-2);
Meanh=(SUMh)/area;
x=edges(1:end-1);
Meanh(26)=Meanh(25);
x(26)=0;
exponentmu=1/((12130.6131942527+1000)); %count rate start burst in hz
ex_plot=(exppdf(-x/1000,exponentmu));
A=trapz(x,ex_plot);

histogram('BinEdges', edges, 'BinCounts',Mean_s,'Normalization','pdf','facecolor','b','facealpha',.2,'edgealpha',.2, 'edgecolor','none')
hold on
stairs(x,Meanh,':r','LineWidth',2)
plot(x,ex_plot/A,'k','LineWidth',1)
title('10ms Bursts','FontSize',15)
xlabel('Deviation in milliseconds','FontSize',15)
ylabel('Probability Density','FontSize',15)

subplot(2,3,6)
edges=-5E-1:2E-2:0;
Bursts=[.1 .3 .5 .7 .9]*1000; %ms
BD=100; %ms
s_1=histcounts(EndBurstTimeApproach1{1,3}(:,1)*1000-(Bursts(1)+BD/2),edges);
s_2=histcounts(EndBurstTimeApproach1{1,3}(:,2)*1000-(Bursts(2)+BD/2),edges);
s_3=histcounts(EndBurstTimeApproach1{1,3}(:,3)*1000-(Bursts(3)+BD/2),edges);
s_4=histcounts(EndBurstTimeApproach1{1,3}(:,4)*1000-(Bursts(4)+BD/2),edges);
s_5=histcounts(EndBurstTimeApproach1{1,3}(:,5)*1000-(Bursts(5)+BD/2),edges);

SUMs=s_1+s_2+s_3+s_4+s_5;
Mean_s=SUMs/5;

h_1=histcounts(EndBurstTimeApproach2{1,3}(:,1)*1000-(Bursts(1)+BD/2),edges);
h_2=histcounts(EndBurstTimeApproach2{1,3}(:,2)*1000-(Bursts(2)+BD/2),edges);
h_3=histcounts(EndBurstTimeApproach2{1,3}(:,3)*1000-(Bursts(3)+BD/2),edges);
h_4=histcounts(EndBurstTimeApproach2{1,3}(:,4)*1000-(Bursts(4)+BD/2),edges);
h_5=histcounts(EndBurstTimeApproach2{1,3}(:,5)*1000-(Bursts(5)+BD/2),edges);

SUMh=h_1+h_2+h_3+h_4+h_5;
area= sum(SUMh*2E-2);
Meanh=(SUMh)/area;
x=edges(1:end-1);
Meanh(26)=Meanh(25);
x(26)=0;
exponentmu=1/((12130.6131942527+1000)); %count rate start burst in hz
ex_plot=(exppdf(-x/1000,exponentmu));
A=trapz(x,ex_plot);


histogram('BinEdges', edges, 'BinCounts',Mean_s,'Normalization','pdf','facecolor','b','facealpha',.2,'edgealpha',.2, 'edgecolor','none')
hold on
stairs(x,Meanh,':r','LineWidth',2)
plot(x,ex_plot/A,'k','LineWidth',1)
title('100ms Bursts','FontSize',15)
xlabel('Deviation in milliseconds','FontSize',15)
ylabel('Probability Density','FontSize',15)

legend('Gillespie approach','Discrete time approach','Expected Exponential Probability Distribution','FontSize',15,'Orientation','horizontal') 
fig=gcf;
fig.Position(3)=fig.Position(3);
Lgnd=legend('show');
Lgnd.Position(1)=.780;
Lgnd.Position(2)=.927;