
%makes a regressor set eX that is scaled in time

%lever/sensory stim
Nlimiter=10;
shift=int32(delay/reskern)/Nlimiter; %500

%[Q1,R1]=quorem(sym(t),sym(reskern));

eX=zeros(size(filteredstim,1),size(filteredstim,2)*shift);

column=1;
for i=1: size(filteredstim, 2) %for each predictor e.g. 90-degree-on
    
    for n=1:shift
        indShift=zeros(size(filteredstim, 1),1);
        indShift(n:end)=filteredstim(1:end+1-n, i);
        eX(:, column)=indShift;
        column=column+1;
    end    
end




%scale each column such that its sum is 1

eX=eX./sum(eX);
%[xsize, ysize]=size(eX);
%for col=1:ysize
%    scaler=std(eX(:, col));
%    eX(:, col)=eX(:, col)/scaler;
%end

dep=filteredcells;










