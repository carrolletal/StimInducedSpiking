load('/Users/brianacarroll/Desktop/091824/091824template_NEV.mat')
%
%%
electrodes= taskSpikes{1,1}(:,1);
units= taskSpikes{1,1}(:,2);
timestamps= 1000*taskSpikes{1,1}(:,3); %units  are 30kHz samples, convert to ms

celltimes=timestamps(find(electrodes<129 & units<255)); 
bnctimes=timestamps(find(electrodes==129)); %differ by 30ish ms bc of frame rate

%check if there is a 2nd, 3rd or more, unit on the electrode
%and ascribe a unique ID
electrodesSorted=electrodes;
extraCellIndex=unique(units(find(units>1 & units<255)));
numUnits=33;
for i=1:length(extraCellIndex)
    splitChannels= unique(electrodes(find(units==extraCellIndex(i))));
    for j=1:length(splitChannels)
        SplitIndex=find(electrodes==splitChannels(j) & units==extraCellIndex(i));
        electrodesSorted(SplitIndex)=numUnits;
        numUnits=numUnits+1;
    end
end

%stimtimes from digital signals
taskeventarray=cell2mat(taskEvents); %columns are task vars 
taskeventarray=taskeventarray(2:end); %columns are task vars 

stimvar=zeros(length(taskeventarray),1); 
trialEnds=zeros(length(taskeventarray),1); 
stimSFreq=zeros(length(taskeventarray),1); 
stimContrast=zeros(length(taskeventarray),1); 
stimTFreq=zeros(length(taskeventarray),1); 
LEDvar=zeros(length(taskeventarray),1); 
stimtimes=zeros(length(taskeventarray),1);
visDur=zeros(length(taskeventarray),1); 
powDur=zeros(length(taskeventarray),1); 
%stimSF=zeros(length(taskeventarray),1); 
for i=1:length(taskeventarray) %iterate over knoT's encoded stim presentations and trial init/end signals 
    if ~isempty(taskeventarray(i).orientation) %y else skipping slots, produce false 0 val stim
        LEDvar(i)=taskeventarray(i).powerStimUW.data; 
        stimvar(i)=taskeventarray(i).orientation.data; 
        stimSFreq(i)=taskeventarray(i).spatialFreq.data; 
        stimtimes(i)=taskeventarray(i).trialStart.timeS*1000;
        trialEnds(i)=taskeventarray(i).trialEnd.timeS*1000;
        visDur(i)=taskeventarray(i).visualDurMS.data;
        powDur(i)=taskeventarray(i).powerDurMS.data;
        stimContrast(i)=taskeventarray(i).contrast.data;
        stimTFreq(i)=taskeventarray(i).temporalFreq.data;
        %-taskeventarray(i).trialEnd.timeS*1000; %units are ms
    end
end
intertrials=find(stimtimes==0);
for i=1:length(intertrials)
    bnctimes = [bnctimes(1:intertrials(i)-1);0;bnctimes(intertrials(i):end)];
end %fixed bug 7/5/24, test that find(stimtimes==0)==find(bnctimes==0)

stimlevels=unique(stimvar);
LEDlevels=unique(LEDvar);
beep
%%
%build the y matrix

realspikeindex=find(electrodesSorted<129 & units<255);
activechannels=unique(electrodesSorted(realspikeindex));
yMatrix=zeros(length(activechannels), int32(max(timestamps)));

for spike=1:length(realspikeindex)
    index=realspikeindex(spike);
    yMatrix(find(activechannels==electrodesSorted(index)), int32(timestamps(index)))=1;
end

%%
%%build the x matrix
stimlist=unique(stimvar);
stimlist=stimlist(find(stimlist));

%LEDmatrix=zeros(1, int32(max(timestamps)));
orientMatrix=zeros(length(unique(stimvar))-1, int32(max(timestamps)));

for stim=1:length(stimvar)
    if stimvar(1)>0
        if stimvar(stim)==0
            break
        else
            orientMatrix(find(stimlist==stimvar(stim)),int32(bnctimes(stim)))=1;
        end
    end
end

%%%
xMatrix=[orientMatrix];