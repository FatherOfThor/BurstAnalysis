%% Test false positives
%load the background burst search data
OpenData=sprintf('C:\\Users\\odink\\Documents\\Uni\\BEP\\Matlab\\Simulations\\Background2\\Sliding Time Window\\5 photon\\DataSet_1\\DataSet_1_APBS_2CnoMFD.bur');
Data=load(OpenData,'-mat');
PhotonStartEnd=Data.BurstData.BID;
TraceTime=1*60*60; %1hour in seconds

NBursts=size(PhotonStartEnd,1);

FalsePositiveRateSlidingTimeWindow5Photon=NBursts/TraceTime;
