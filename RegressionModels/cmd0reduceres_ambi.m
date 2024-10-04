%reduce res
%changes to incorporate cmdpre2_removeintertrials
%cmdpre2_removeintertrials_ambi

reskern=30 %sample dataset is 30 kHz, reduce to 1 ms resolution
[cells, t]=size(yMatrix);

start=1;
for time=1:(t/reskern)
    stop=time*reskern; 
    %reduce resolution of neuronal activity and task-related variables
    lorescells(time, :)=sum(yMatrix(:,start:stop)');
    loresstim(time, :)=sum(xMatrix(:,start:stop)');
    start=start+reskern; 
end
clear('start', 'stop')
beep

%prep for cue dur
%revisedset=lorestask(:,2);
%spotinlist=1;
%for n=1:t/reskern
%    if revisedset(n,1)==1
%        revisedset(n)=delays(spotinlist,1);
%        spotinlist=spotinlist+1;
%    end
%end

