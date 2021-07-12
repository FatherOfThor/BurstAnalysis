%% Revise photon start and ends
%this script updates the MT's within the defined regions
time_res = 12.5*1E-9;
burstduration=100; %ms

for i=1:1000
OpenData=sprintf('C:\\Users\\odink\\Documents\\Uni\\BEP\\Matlab\\Simulations\\Intensity 20x, burst vary\\Approach2 Run2\\Sliding Time Window\\Intensity_20x_background__burstduration_100.0ms\\DataSet_%d.ppf',i);
DataBurstsMT(i)=load(OpenData,'-mat', 'MT');
end

for i=1:size(DataBurstsMT,2)
    DataBurstsMTNew{i}=(DataBurstsMT(i).MT{1,1})*time_res;
end

PhotonNumbersSecondApproach100_0ms=[];
for i=1:size(DataBurstsMT,2)
    for j=1:5
        PhotonNumbersSecondApproach100_0ms{i,j}=[];
        for ii=1:size(DataBurstsMTNew{i},1)
            if DataBurstsMTNew{i}(ii)>((0.1+0.2*(j-1))-burstduration/2000)&&DataBurstsMTNew{i}(ii)<((0.1+0.2*(j-1))+burstduration/2000)
                PhotonNumbersSecondApproach100_0ms{i,j}(end+1)=ii;
            end
        end
    end
end
