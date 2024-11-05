
%makes a regressor set eX that is scaled in time

%lever/sensory stim
shift=int32(delay/reskern); %500
Nlimiter=10;

%[Q1,R1]=quorem(sym(t),sym(reskern));

eX=zeros(size(filteredstim,1),size(filteredstim,2)*shift/Nlimiter);

column=1;
for i=1: size(filteredstim, 2) %for each predictor e.g. 90-degree-on
    
    for n=1:Nlimiter:shift
        indShift=zeros(size(filteredstim, 1),1);
        indShift(n:end)=filteredstim(1:end+1-n, i);
        eX(:, column)=indShift;
        column=column+1;
    end

    
end



%scale each column such that its sum is 1
[xsize, ysize]=size(eX);
for col=1:ysize
    scaler=std(eX(:, col));
    eX(:, col)=eX(:, col)/scaler;
end

dep=filteredcells;










