addpath /Users/brianacarroll/Desktop/GLMs
delay=12000; %in original 30 kHz trace, so delay=12000 yields 4s of betas
fold=5;

NEVtoRidgeInputs
%or, since that data file is huge, I've provided the output as a .mat:
%load('NEVtoRidgeInputsResult.mat')

%for 091824, cut off end which is opto only
xMatrix=xMatrix(1:end-1, 1:10485000);
yMatrix=yMatrix(:, 1:10485000);

%data processing steps
reskern=300; %sample dataset is 30 kHz, so reskern=300 yiels 10 ms resolution
cmd0reduceres_ambi %reduce resolution of neuronal activity and task-related variables

filter=1;
if filter==1
    cmd1smooth_predstoo %smooth spikes to gaussians
else
    filteredcells=lorescells; 
    filteredstim=loresstim;
end

cmd2regressorset_UNreduced2_ambi %produce regressor set with delays

modelrsqs=zeros(2+2*preds, fold, cells);

%all shuffled together in time, but
%move into for-cell to generate per cell
cmd8_shuffle;  %sum of ord==sum of shuff'd, so this code works.
fullX=eX;
indices=1:shift:size(eX,2); indices=[indices, size(eX,2)+1];
recerror=[];


%set up error trackers to measure model success

fname='shuffleandsubOutput'; mkdir(fname); cd(fname)

foldsize=length(dep)/fold;

eX=fullX; 
cmd6CV;
% Save the results to a .mat file
fname = 'ridgeMMLResultsFull';  % Define a filename prefix
save([fname, '_Betas.mat'], 'betas', 'lambdas', 'convergenceFailures', 'rsqs');
save([fname, '_TestSets.mat'], 'reals', 'ybars', 'tests', 'rsqs');

modelrsqs(1,:,:)=rsqs;

plotBetas=1;
plotTogether=1;
plotSeparate=0;

if plotBetas
    if plotTogether
        figure;hold
    end
    for i=1:2%cells
        cellMatrix=squeeze(betas(:,2:end, i));
       
        cellMatrixMean=mean(cellMatrix);
        sem=std(cellMatrix)/sqrt(size(cellMatrix,2))
        if plotSeparate
            figure;hold
        end
        for j=1%:size(indices,2)-1
            predictorBetas=cellMatrixMean(indices(j):indices(j+1)-1)
            predictorError=sem(indices(j):indices(j+1)-1)
            plot(predictorBetas, 'LineWidth',2)
            %xline(30)
            patch([[1:size(predictorBetas,2)] flip([1:size(predictorBetas,2)])], [predictorBetas-predictorError flip(predictorBetas+predictorError)], 'black', 'FaceAlpha',0.25, 'EdgeColor','none')          
        end
        if plotSeparate
            figname=[num2str(i), 'allCellsStimBetas.tiff']
            print(gcf, '-dtiff', figname);
            yline=0;
        end
        
    end
        %figname=['allCellsStimBetas.tiff']
        %print(gcf, '-dtiff', figname);
end

eX=shuffledeX; 
cmd6CV;
fname = 'ridgeMMLResultsShuff';  % Define a filename prefix
save([fname, '_Betas.mat'], 'betas', 'lambdas', 'convergenceFailures', 'rsqs');
save([fname, '_TestSets.mat'], 'reals', 'ybars', 'tests', 'rsqs');

modelrsqs(2,:,:)=rsqs;


%%%%%%sole predictor type
for predictor=1:length(indices)-1
    rsqIndex=3;

    start=indices(predictor);
    stop=indices(predictor+1)-1;
    
    %reduced model with that variable shuffled
    eX=fullX; eX(:, start:stop)=shuffledeX(:, start:stop);
    cmd6CV;
    fname = ['ridgeMMLResults',int2str(predictor), 'shuffled'];  % Define a filename prefix
    save([fname, '_Betas.mat'], 'betas', 'lambdas', 'convergenceFailures', 'rsqs');
    save([fname, '_TestSets.mat'], 'reals', 'ybars', 'tests', 'rsqs');
    
    modelrsqs(rsqIndex,:,:)=rsqs;

   
    
    %reduced model with every other variable shuffled
    eX=shuffledeX; eX(:, start:stop)=fullX(:,start:stop);      
    cmd6CV;
    
    fname = ['ridgeMMLResults',int2str(predictor), 'only'];  % Define a filename prefix
    save([fname, '_Betas.mat'], 'betas', 'lambdas', 'convergenceFailures', 'rsqs');
    save([fname, '_TestSets.mat'], 'reals', 'ybars', 'tests', 'rsqs');

    modelrsqs(rsqIndex+1,:,:)=rsqs;
    
    rsqIndex=rsqIndex+2;

    end

%%%%
save('rsqs.mat', 'modelrsqs')







