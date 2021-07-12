%% load MT data of simulated time traces
for i=1:1000
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%load the simulation files
OpenData=sprintf('C:\\Users\\odink\\Documents\\Uni\\BEP\\Matlab\\Simulations\\Intensity 20x, burst vary\\UnbiasedAgain2 Approach1\\Sliding Time Window\\Intensity_20x_background__burstduration_1.0ms\\DataSet_%d.ppf',i);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DataBurstsMT(i)=load(OpenData,'-mat', 'MT');
end
burstduration=1; %burst duration in ms
%% Start and end times of bursts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load the simulated photon start and end numbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear StartBurstTime
clear EndBurstTime
time_res = 12.5*1E-9;
for i=1:1000
    for j=1:5
        if size(dict_PhotonNumbersOut1_0ms{i,j},1)==0
            StartBurstNumber(i,j)=0;
            EndBurstNumber(i,j)=0;
        else
            StartBurstNumber(i,j)=min(dict_PhotonNumbersOut1_0ms{i,j});
            EndBurstNumber(i,j)=max(dict_PhotonNumbersOut1_0ms{i,j});
        end
    end
end

for i=1:1000
    for j=1:5
        if StartBurstNumber(i,j)~=0
        x=StartBurstNumber(i,j);
        y=EndBurstNumber(i,j);
        StartBurstTime(i,j)=(DataBurstsMT(i).MT{1,1}(x))*time_res;
        EndBurstTime(i,j)=(DataBurstsMT(i).MT{1,1}(y))*time_res;
        else 
            continue
        end
    end
end

StartBurstTimeApproach1{1,1}=StartBurstTime(:,:); %MT's of start
EndBurstTimeApproach1{1,1}=EndBurstTime(:,:); %MT's of end


%% after burst search load the merged data file
for i=1:1000
OpenData=sprintf('C:\\Users\\odink\\Documents\\Uni\\BEP\\Matlab\\Simulations\\Intensity 20x, burst vary\\UnbiasedAgain2 Approach1\\Sliding Time Window\\Intensity_20x_background__burstduration_1.0ms\\DataSet_%d.ppf',i);
DataBurstsMT(i)=load(OpenData,'-mat', 'MT');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%open merged burst search file
OpenData=sprintf('C:\\Users\\odink\\Documents\\Uni\\BEP\\Matlab\\Simulations\\Intensity 20x, burst vary\\UnbiasedAgain2 Approach1\\Sliding Time Window\\Intensity_20x_background__burstduration_1.0ms\\Mergedagain1_500_3_APBS_2CnoMFD.bur');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Data=load(OpenData,'-mat');
BurstsSimulated=Data.BurstData.MergedParameters.FileName;
Burstnumbers=strrep(BurstsSimulated(1:end),'DataSet_','');
Burstnumbersfinal=strrep(Burstnumbers(1:end),'_APBS_2CnoMFD.bur' ,'');
PhotonStartEnd=Data.BurstData.BID;
time_res = 12.5*1E-9;
%% map Photon numbers with MT
clear MTBurstsAlligned
clear PhotonStartEndTimes
clear StartTimes
clear EndTimes
clear FinalPhotonStartEndTimes
clear FinalPhotonStartEnd
clear PhotonStartWrite

MinimumNumPhotons=1; %minimum number of photons per burst threshold

for i=1:numel(PhotonStartEnd)
    for j=1:size(PhotonStartEnd{i},1)
        if PhotonStartEnd{i}(j,2)-PhotonStartEnd{i}(j,1)>=MinimumNumPhotons
            continue
        else
            PhotonStartEnd{i}(j,:)=[0,0];
        end
    end
end

PhotonStartWrite=[];

for i=1:numel(PhotonStartEnd)
    PhotonStartWrite{i}=[];
    for j=1:size(PhotonStartEnd{i},1)
        if PhotonStartEnd{i}(j,1)+PhotonStartEnd{i}(j,2)~=0
            PhotonStartWrite{i}(end+1,:)=PhotonStartEnd{i}(j,:);
        end
    end
end

PhotonStartWrite=PhotonStartWrite';

for i=1:numel(PhotonStartEnd)
    MTBurstsAlligned(i)=DataBurstsMT(str2double(Burstnumbersfinal{1,i}));
end

for i=1:numel(PhotonStartEnd)
    PhotonStartEndTimes{i}=(MTBurstsAlligned(i).MT{1,1}(PhotonStartWrite{i,1}))*time_res;
    if size(PhotonStartEndTimes{i},2)~=2
        PhotonStartEndTimes{i}=PhotonStartEndTimes{i}';
    end
end

FinalPhotonStartEndTimes=[];
FinalPhotonStartEnd=[];
for i=1:size(PhotonStartEndTimes,2)
    FPbefore(i)=size(PhotonStartEndTimes{i},1);
    FinalPhotonStartEndTimes{i}=[];
    FinalPhotonStartEnd{i}=[];
    for ii=1:size(PhotonStartEndTimes{i},1)
        if (((PhotonStartEndTimes{i}(ii,1))<(0.1-(burstduration/2000))&& PhotonStartEndTimes{i}(ii,2)<(0.1-burstduration/2000))|| ((PhotonStartEndTimes{i}(ii,1))>(0.1+(burstduration/2000))&& PhotonStartEndTimes{i}(ii,2)<(0.3-burstduration/2000))|| ((PhotonStartEndTimes{i}(ii,1))>(0.3+(burstduration/2000))&& PhotonStartEndTimes{i}(ii,2)<(0.5-burstduration/2000))|| ((PhotonStartEndTimes{i}(ii,1))>(0.5+(burstduration/2000))&& PhotonStartEndTimes{i}(ii,2)<(0.7-burstduration/2000))|| ((PhotonStartEndTimes{i}(ii,1))>(0.7+(burstduration/2000))&& PhotonStartEndTimes{i}(ii,2)<(0.9-burstduration/2000))||((PhotonStartEndTimes{i}(ii,1))>(0.9+(burstduration/2000))&& PhotonStartEndTimes{i}(ii,2)>(0.9+burstduration/2000)))
            PhotonStartEndTimes{i}(ii,:)=0; %set to 0 such that we can remove it
            PhotonStartWrite{i,1}(ii,:)=0;
        end
        if PhotonStartEndTimes{i}(ii,1)~=0
            FinalPhotonStartEndTimes{i}(end+1,:)=PhotonStartEndTimes{i}(ii,:);
            FinalPhotonStartEnd{i}(end+1,:)=PhotonStartWrite{i}(ii,:);
        end
    end
    FPafter(i)=size(FinalPhotonStartEndTimes{i},1);
    FalseDetections(i)=FPbefore(i)-FPafter(i); %false detections per second
end


for i=1:numel(FinalPhotonStartEnd)
    if size(FinalPhotonStartEndTimes{1,i},2)>1
        StartTimes{i}=FinalPhotonStartEndTimes{1,i}(1:end,1);
        EndTimes{i}=FinalPhotonStartEndTimes{1,i}(1:end,2);
    elseif size(FinalPhotonStartEndTimes{1,i},2)==1
        StartTimes{i}=FinalPhotonStartEndTimes{1,i}(1,1);
        EndTimes{i}=FinalPhotonStartEndTimes{1,i}(2,1);
    else
        continue
    end
end

StartTimesArray=[];
EndTimesArray=[];
StartTimesCheck=[];
IndexStart=[];
IndexEnd=[]; 
EndTimesCheck=[];
for i=1:numel(StartTimes)
    StartTimesCheck{i}=[];
    IndexStart{i}=[];
    EndTimesCheck{i}=[];
    IndexEnd{i}=[];
    if size(StartTimes{i},1)>5
        for j=[.1,.3,.5,.7,.9]
            [StartTimesCheck{i}(end+1), IndexStart{i}(end+1)]=min(abs(StartTimes{i}-(j-burstduration/2000)));
            [EndTimesCheck{i}(end+1), IndexEnd{i}(end+1)]=min(abs(EndTimes{i}-(j+burstduration/2000)));
        end
        for n=1:5
            StartTimesArray(end+1)=StartTimes{i}(IndexStart{i}(n));
            EndTimesArray(end+1)=EndTimes{i}(IndexEnd{i}(n));
        end
    else
        for j=1:numel(StartTimes{1,i})
            StartTimesArray(end+1)=StartTimes{1,i}(j);
            EndTimesArray(end+1)=EndTimes{1,i}(j);
        end
    end
end

FalsePositiveRateSlidingTimeWindow(1,1)=100-(mean(rmmissing(FPafter(:)./(FPbefore(:))))*100); %False positive percentage
FalseNegativeRateSlidingTimeWindow(1,1)=100-((numel(StartTimesArray)/5000)*100); %False negative percentage
FalseDetectionsPerSecondSlidingTimeWindow(1,1)=mean(FalseDetections); %False detection rate

for i=1:size(FinalPhotonStartEndTimes,2)
    if size(FinalPhotonStartEndTimes{i},1)<5
        SplittingFrequencySlidingTimeWindow{1,1}(i)=1; %splitting frequency
    else
        SplittingFrequencySlidingTimeWindow{1,1}(i)=(size(FinalPhotonStartEndTimes{i},1))/5; %splitting frequency
    end
end

%% Photon deviation
for i=1:numel(Burstnumbersfinal)
    DictOrdered{i}=dict_PhotonNumbersOut1_0ms(str2double(Burstnumbersfinal{i}),:); %load photon numbers of simulated bursts
end

for i=1:numel(Burstnumbersfinal)
    for j=1:size(DictOrdered{i},2)
        PhotonStartOrdered{i}(1,j)=min(DictOrdered{i}{1,j});
        PhotonEndOrdered{i}(1,j)=max(DictOrdered{i}{1,j});
    end
end

CheckDataStart=[];
CheckDataEnd=[];
PhotonIndexStart=[];
PhotonIndexEnd=[];
NumPhotonStartDeviation=[];
NumPhotonEndDeviation=[];
for i=1:numel(FinalPhotonStartEnd)
    CheckDataStart{i}=[];
    PhotonIndexStart{i}=[];
    CheckDataEnd{i}=[];
    PhotonIndexEnd{i}=[];
    if size(FinalPhotonStartEnd{i},1)>5
        for j=PhotonStartOrdered{i}
            [CheckDataStart{i}(end+1),PhotonIndexStart{i}(end+1)]=min(abs(j-FinalPhotonStartEnd{i}(:,1)));
        end
        for jj=PhotonEndOrdered{i}
            [CheckDataEnd{i}(end+1),PhotonIndexEnd{i}(end+1)]=min(abs(jj-FinalPhotonStartEnd{i}(:,2)));
        end
        
        for n=1:size(PhotonIndexStart{i},2)
            NumPhotonStartDeviation(end+1)=PhotonStartOrdered{i}(1,n)-FinalPhotonStartEnd{i}(PhotonIndexStart{i}(1,n),1);
            NumPhotonEndDeviation(end+1)=PhotonEndOrdered{i}(1,n)-FinalPhotonStartEnd{i}(PhotonIndexEnd{i}(1,n),2);
        end
    else
        for jjj=1:size(FinalPhotonStartEnd{i},1)
            [CheckDataStart{i}(end+1),PhotonIndexStart{i}(end+1)]=min(abs(PhotonStartOrdered{i}(:,:)-FinalPhotonStartEnd{1,i}(jjj,1)));
            [CheckDataEnd{i}(end+1),PhotonIndexEnd{i}(end+1)]=min(abs(PhotonEndOrdered{i}(:,:)-FinalPhotonStartEnd{1,i}(jjj,2)));
        end
        for nn=1:size(PhotonIndexStart{i},2)
            NumPhotonStartDeviation(end+1)=PhotonStartOrdered{i}(1,PhotonIndexStart{i}(1,nn))-FinalPhotonStartEnd{i}(nn,1);
            NumPhotonEndDeviation(end+1)=PhotonEndOrdered{i}(1,PhotonIndexEnd{i}(1,nn))-FinalPhotonStartEnd{i}(nn,2);
        end
    end 
end


NumPhotonOutliers=5000; %here you can define a maximum number of photon deviation to filter on outliers even more
NumPhotonStartDeviationFinal=[];
NumPhotonEndDeviationFinal=[];
for i=1:numel(NumPhotonStartDeviation)
    if abs(NumPhotonStartDeviation(i))>=NumPhotonOutliers 
        continue
    else
        NumPhotonStartDeviationFinal(end+1)=NumPhotonStartDeviation(i)*-1; %invert to get photon deviation from simulated start
    end
end
for i=1:numel(NumPhotonEndDeviation)
    if abs(NumPhotonEndDeviation(i))>=NumPhotonOutliers
        continue
    else
        NumPhotonEndDeviationFinal(end+1)=NumPhotonEndDeviation(i)*-1;
    end        
end

CUSUMPhotonStart{1,3}=NumPhotonStartDeviationFinal; %Photon deviation start
CUSUMPhotonEnd{1,3}=NumPhotonEndDeviationFinal; %Photon deviation end

%% Time deviation
DifferenceStartAfterDetection={};
DifferenceEndAfterDetection={};
DifferenceStartAfterDetections={};
DifferenceEndAfterDetections={};
Istart={};
Iend={};

for i=1:numel(StartTimes)
    DifferenceEndAfterDetection{i}=[];
    DifferenceStartAfterDetection{i}=[];
    DifferenceEndAfterDetections{i}=[];
    DifferenceStartAfterDetections{i}=[];
    Istart{i}=[];
    Iend{i}=[];
    length=size(StartTimes{i},1);
    if size(StartTimes{i},1)>5
        for n=1:5
            DifferenceStartAfterDetection{i}(end+1)=(((StartTimes{i}(IndexStart{i}(n)))-StartBurstTime(str2double(Burstnumbersfinal{1,i}),n))*1000);
            DifferenceEndAfterDetection{i}(end+1)=(((EndTimes{i}(IndexEnd{i}(n)))-EndBurstTime(str2double(Burstnumbersfinal{1,i}),n))*1000);
        end
    else
        for j=1:length
            [DifferenceStartAfterDetections{i}(end+1),Istart{i}(end+1)]=min(abs(StartTimes{i}(j)-StartBurstTime(str2double(Burstnumbersfinal{1,i}),:))*1000); %difference in ms
            [DifferenceEndAfterDetections{i}(end+1),Iend{i}(end+1)]=min(abs(EndTimes{i}(j)-EndBurstTime(str2double(Burstnumbersfinal{1,i}),:))*1000); %difference in ms
            DifferenceStartAfterDetection{i}(1,end+1)=((StartTimes{i}(j)-StartBurstTime(str2double(Burstnumbersfinal{1,i}),Istart{i}(j)))*1000);
            DifferenceEndAfterDetection{i}(1,end+1)=((EndTimes{i}(j)-EndBurstTime(str2double(Burstnumbersfinal{1,i}),Iend{i}(j)))*1000);
        end               
    end
end

ArrayStartTimes=[];
ArrayStopTimes=[];
for i=1:size(DifferenceStartAfterDetection(:,:),2)
    length3=size(DifferenceStartAfterDetection{i},2);
    for j=1:length3
        ArrayStartTimes(end+1)=DifferenceStartAfterDetection{i}(1,j); %in seconds
        ArrayStopTimes(end+1)=DifferenceEndAfterDetection{i}(1,j); %in seconds
    end
end

RemovedOutliersArrayStartTimes=[];
RemovedOutliersArrayEndTimes=[];
TimeBarrier=100000; %here another outlier filter can be defined in the time dimension
for i=1:numel(ArrayStartTimes)
    if abs(ArrayStartTimes(i))<=(TimeBarrier*burstduration/2) && abs(ArrayStopTimes(i))<=(TimeBarrier*burstduration/2) 
        RemovedOutliersArrayStartTimes(end+1)=ArrayStartTimes(i);
        RemovedOutliersArrayEndTimes(end+1)=ArrayStopTimes(i);
    end
end
MeanDifferenceStartAfterDetectionInterphotonRemOutliers(1,1)=mean(RemovedOutliersArrayStartTimes);
MeanDifferenceEndAfterDetectionInterphotonRemOutliers(1,1)=mean(RemovedOutliersArrayEndTimes);

PlotDistributionStartSlidingTimeWindow{1,1}=RemovedOutliersArrayStartTimes; %time deviation output
PlotDistributionEndSlidingTimeWindow{1,1}=RemovedOutliersArrayEndTimes; %time deviation output

