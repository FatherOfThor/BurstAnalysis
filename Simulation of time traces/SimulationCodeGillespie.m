clc
clear all
close all
format compact 
Number_of_analysis=1000;
for iii=1:Number_of_analysis
%% Initialisation and Intensity profiling
I_background= 1000; %counts per event
N_cells=1; %amount of systems we are investigating
max_signal_to_noise_scale=20; %the highest intensity of an event
N_S=5; %# intensity states for the event of N different cells
max_intensity= (max_signal_to_noise_scale)*I_background; %counts per event
I_event= linspace(I_background*20,max_intensity,N_S); %currently I_event is kept constant at 20x snr

I_out_pdf=zeros(5,N_S+2);
I_out_save=[];
for i= 1:N_S
        x=[I_event(i)-1,I_event(i)-(2/3),I_event(i)-(1/3),I_event(i),I_event(i)+1/3,I_event(i)+2/3,I_event(i)+1]; %define gaussian on -/+ 1 std
        I_out_pdf(i,:)=normpdf(x,I_event(i));
        I_out_save(i,:)= ((I_out_pdf(i,:)./I_out_pdf(i,4))*I_event(i)); %normalize intensities
end

Spikes_sort=[100,300,500,700,900]; %pick manual timepoints of bursts in ms
ChangePoints=Spikes_sort./1000; %in seconds

%% Photon arrival time computation
% we simulate a fixed amount of time, based on a constant count rate
time_res = 12.5*1E-9; % the time resolution of the system, here 12.5 nanosecond (80 MHz)
cr_back = 1; % 1 kHz
t=(ChangePoints)./time_res;
t(end+1)=((I_background/1000))/time_res; %such that we can loop till last photon, it is the simulation end time
t_event=ChangePoints./time_res;
current_time = 0; % last photon arrival time
burst_loop_time=0; % to loop over the burst times
time_per_intensity=zeros(1,N_S);
burst_duration=zeros(1,N_S);
for i=1:numel(Spikes_sort)
    burst_duration(i)=(100)/1000; %in seconds
    time_per_intensity(i)=burst_duration(i)/(numel(x)); 
end
burst_duration(end+1)=0; %defined such that we can loop until the end of the simulation and not stop at last burst instantly 
MT = [];
MT_Burst=[];
MT_Background=[];
PhotonNumbers=[];
MT_save = cell(N_cells,1); % the "macrotime", i.e. the photon arrival time measured with respect to the start of the measurement

%draw the background photons
while (current_time<t(end))
    dt=round((exprnd(1/I_background))/time_res);
    if dt<1
        dt=1;
    end
    current_time=current_time+dt;
    MT_Background(end+1)=current_time;
end

%draw event photons
dtsave=[];
for i=1:numel(t_event)
    current_time=t_event(i)-(burst_duration(i)/(2*time_res));
    for n=1:numel(x)
        burst_loop_time=0;
        while burst_loop_time<time_per_intensity(i)/time_res
            dt=round((exprnd(1/(I_out_save(i,n))))/time_res);
            dtsave(end+1)=dt;
            if dt<1
                dt=1;
            end
            current_time=current_time+dt;
            burst_loop_time=burst_loop_time+dt;
            if current_time>t_event(i)-(burst_duration(i)/(2*time_res))+(((n)*time_per_intensity(i))/time_res) %if current time exceeds the intensity state time
                current_time=round(t_event(i)-(burst_duration(i)/(2*time_res))+(((n)*time_per_intensity(i))/time_res)); %reset the clock
                continue %go to the next loop without saving MT
            end
            MT_Burst(end+1) = current_time;
            MT=sort([MT_Background,MT_Burst]);%sort MTs of events and background in right time order
            for ii=1:numel(MT)-1 %if we are really unlucky a background photon and event photon are on the same timestamp, so add 1 time resolution step if this occurs
                if MT(ii)==MT(ii+1)
                    MT(ii+1)=MT(ii+1)+1;
                end
            end
        end
    end
end

if MT(end)>t(end)
    MT(end)=[];
end %remove last photon such that every dataset ends in 1s
MT_save{1,1}=MT'; %Right format for PAM

%find the burst MT's
for i=1:numel(MT)
    for j=1:numel(t_event)
        if MT(i)>=(((0.1+0.2*(j-1))-burst_duration(1)/2)/time_res) && MT(i)<=(((0.1+0.2*(j-1))+burst_duration(1)/2)/time_res)
            PhotonNumbers(j,end+1)=find(MT(i)==MT);
        end
    end
end
%save the photon arrival and end numbers of bursts structured
for i=1:size(PhotonNumbers,1)
    PhotonNumbersOut=[];
    for j=1:size(PhotonNumbers,2)
        if PhotonNumbers(i,j)~=0
            PhotonNumbersOut(i,end+1)=PhotonNumbers(i,j);
        end

    end
    if size(PhotonNumbersOut,1)==0
        PhotonNumbersOut(i,1)=0;
    end
    dict_PhotonNumbersOut100_0ms{1,i}=(PhotonNumbersOut(i,:));  %save this variable if you want to analyse burst search behaviour 
end

% truncate to the shortest macrotime
MeasurementTime = min(cellfun(@max,MT_save));
for i = 1:numel(MT_save)
    MT_save{i} = MT_save{i}(MT_save{i} <= MeasurementTime);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Below, additional data is defined %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define "microtime" data (relates to the delay to the excitation pulse in
% experiments with pulsed lasers)
MI = cell(N_cells,1);
MI_Bins = 100;
for i = 1:N_cells
    MI{i,1} = randi(MI_Bins,size(MT_save{i,1}));
end
MI=MI';
%%% Minimal set of meta data
Info = struct;
Info.ClockPeriod = time_res;
Info.SyncPeriod = time_res; % the macrotime period
Info.TACRange = time_res; % the microtime range
Info.MI_Bins = MI_Bins; % number of microtime bins
Info.MeasurementTime = time_res*MeasurementTime;
% some other meta data that relates to imaging (but is required)
Info.Pixels = 1;
Info.Lines = 1;
Info.LineTimes = [];
%% data save for PAM
%%% save the data
MT=MT_save;
out_path='C:\Users\.....'; %put your location you want to save on here
FileName=sprintf('DataSet_%d.ppf',iii);
full_path=fullfile(out_path,FileName);
save(full_path,'MT','MI','Info');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%if you want to save the photon data as well run the save command below
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%save('PhotonBurstData.mat','dict_PhotonNumbersOut100_0ms')