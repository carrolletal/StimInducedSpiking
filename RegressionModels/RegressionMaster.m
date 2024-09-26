%it processes the inputs by smoothing then and producing lagged versions of the predictors, then trains and tests regresion models from input subsets.  
%this file will take a long time to run.  

delay=250 %%%%%%%%%SET ME!

%fname=['rec' int2str(recnum) 'delay' int2str(delay)]; mkdir(fname); cd(fname);
%load('NaiveRatData.mat'); Dataset=NaiveRatData{1,2}{1,recnum}; delays=load('NaiveRatDatadelays.mat'); delays=delays.delays(:, recnum);
NEVtoRidgeInputs

%data processing steps
cmd0reduceres_ambi
cmd1smooth_predstoo
cmdpre_removeintertrials_ambi
cmd2regressorset_UNreduced2_ambi

%cue, mot, rew are all old predictors from when I used this code with a different dataset.
cuestart=1+(size(levshift,2)) ;
motstart1=1+(size([levshift cueshift],2));
motstart2=1+(size([levshift cueshift motshift1],2));
rewstart=1+(size([levshift cueshift motshift],2));
indices=[cuestart motstart1 motstart2 rewstart];
%now will be [stimvarStart, optoStart, pupilStart], the indices where delay
%is zero

recerror=[]

for cell=1:cells %cells
    load('16predictors.mat'); load('16cells.mat'); dep=dep(:, cell);

    fname=['cell' int2str(c)]; mkdir(fname); cd(fname)

    cell=c; %CHECK COND FORMATTING!!!!
    cmd8_shuffle;  %sum of ord==sum of shuff'd, so this code works.
    fullX=eX;

    fold=10;
    foldsize=length(dep)/fold;

    cmd6CV;
    fullmses=mses;
    fullrsqs=rsqs;
    
    fname=['full']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    %%%%TRversions
    eX=fullX; eX(:, 1:cuestart-1)=TReX(:, 1:cuestart-1);
    cmd6CV;
    TRlevmses=mses;
    TRlevrsqs=rsqs;
    fname=['TRlev']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    eX=fullX; eX(:, cuestart:motstart1-1)=TReX(:, cuestart:motstart1-1);
    cmd6CV;
    TRcuemses=mses;
    TRcuersqs=rsqs;
    fname=['TRcue']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    eX=fullX; eX(:, motstart1:rewstart-1)=TReX(:, motstart1:rewstart-1);
    cmd6CV;
    TRrespmses=mses;
    TRresprsqs=rsqs;
    fname=['TRresp']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..

    eX=fullX; eX(:, rewstart:end)=TReX(:, rewstart:end);
    cmd6CV;
    TRrewmses=mses;
    TRrewrsqs=rsqs;
    fname=['TRrew']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    %%%%%%sole predictor type

    eX=fullX; eX(:, cuestart:end)=shuffledeX(:, cuestart:end);
    %a=82;
    %b=end;
    %a2=0;
    %cmd9_MINIshuffle;
    cmd6CV;
    levonlymses=mses;
    levonlyrsqs=rsqs ;   
    fname=['levonly']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    %%%%

    eX=fullX; eX(:, 1:cuestart-1)=shuffledeX(:,1:cuestart-1); 
    %eX=fullX(:, 22:94);
    %a=1;
    %b=81;
    %a2=0;
    %cmd9_MINIshuffle;
    cmd6CV;
    levoutmses=mses;
    levoutrsqs=rsqs;
    fname=['levout']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    eX=fullX; eX(:, motstart1:end)=shuffledeX(:, motstart1:end); eX(:, 1:cuestart-1)=shuffledeX(:, 1:cuestart-1); 
    %a=1;
    %b=81;
    %a2=163;
    %b2=end;
    %cmd9_MINIshuffle;
    cmd6CV;
    cueonlymses=mses;
    cueonlyrsqs=rsqs ;  
    fname=['cueonly']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    
    eX=fullX; eX(:, cuestart:motstart1-1)=shuffledeX(:,cuestart:motstart1-1); 
    %eX=[fullX(:, 1:21) fullX(:, 43:94)];
    %a=82;
    %b=162;
    %a2=0;
    %cmd9_MINIshuffle;
    cmd6CV;
    cueoutmses=mses;
    cueoutrsqs=rsqs;
    fname=['cueout']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..

    
    eX=fullX; eX(:, rewstart:end)=shuffledeX(:, rewstart:end); eX(:, 1:motstart1-1)=shuffledeX(:, 1:motstart1-1); 
    %a=1;
    %b=162;
    %a2=224;
    %b2=end;
    %cmd9_MINIshuffle;
    cmd6CV;
    responlymses=mses;
    responlyrsqs=rsqs ; 
    fname=['responly']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
  
    eX=fullX; eX(:, motstart1:rewstart-1)=shuffledeX(:,motstart1:rewstart-1); 
    %eX=[fullX(:, 1:42) fullX(:, 73:94)];
    %a=163;
    %b=223;
    %a2=0;
    %cmd9_MINIshuffle;
    cmd6CV;
    respoutmses=mses;
    respoutrsqs=rsqs;
    fname=['respout']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    eX=fullX; eX(:, motstart2:end)=shuffledeX(:, motstart2:end);eX(:, 1:motstart1-1)=shuffledeX(:, 1:motstart1-1);
    %premotor
    %a=1;
    %b=162;
    %a2=183;
    %b2=end;
    %cmd9_MINIshuffle;
    cmd6CV;
    resp1onlymses=mses;
    resp1onlyrsqs=rsqs;
    fname=['resp1only']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    eX=fullX; eX(:, motstart1:motstart2-1)=shuffledeX(:,motstart1:motstart2-1); 
    %premotor
    %a=163;
    %b=182;
    %a2=0;
    %cmd9_MINIshuffle;
    cmd6CV;
    resp1outmses=mses;
    resp1outrsqs=rsqs;
    fname=['resp1out']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    eX=fullX; eX(:, rewstart:end)=shuffledeX(:, rewstart:end); eX(:, 1:motstart2-1)=shuffledeX(:, 1:motstart2-1);
    %postmotor
    %a=1;
    %b=182;
    %a2=224;
    %b2=end;
    %cmd9_MINIshuffle;
    cmd6CV;
    resp2onlymses=mses;
    resp2onlyrsqs=rsqs;
    fname=['resp2only']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    eX=fullX; eX(:, motstart2:rewstart-1)=shuffledeX(:,motstart2:rewstart-1); 
    %postmotor
    %a=183;
    %b=223;
    %a2=0;
    %cmd9_MINIshuffle;
    cmd6CV;
    resp2outmses=mses;
    resp2outrsqs=rsqs;
    fname=['resp2out']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    

    eX=fullX; eX(:, 1:rewstart-1)=shuffledeX(:, 1:rewstart-1);     
    %eX=fullX(:, 73:94); 
    %a=1;
    %b=223;
    %a2=0;
    %cmd9_MINIshuffle;
    cmd6CV;
    rewonlymses=mses;
    rewonlyrsqs=rsqs ;  
    fname=['rewonly']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..
    
    
    eX=fullX; eX(:, rewstart:end)=shuffledeX(:, rewstart:end); 
    %a=224;
    %b=end;
    %a2=0;
    %cmd9_MINIshuffle;
    cmd6CV
    rewoutmses=mses;
    rewoutrsqs=rsqs;
    fname=['rewout']; mkdir(fname); cd(fname)
    save('lambdas1.mat', 'lambdas1', '-v7.3'); 
    save('betas1.mat', 'betas1', '-v7.3'); 
    save('lambdas2.mat', 'lambdas2', '-v7.3'); 
    save('betas2.mat', 'betas2', '-v7.3'); 
    save('lambdas3.mat', 'lambdas3', '-v7.3'); 
    save('betas3.mat', 'betas3', '-v7.3'); 
    save('lambdas4.mat', 'lambdas4', '-v7.3'); 
    save('betas4.mat', 'betas4', '-v7.3'); 
    save('lambdas5.mat', 'lambdas5', '-v7.3'); 
    save('betas5.mat', 'betas5', '-v7.3'); 
    save('lambdas6.mat', 'lambdas6', '-v7.3'); 
    save('betas6.mat', 'betas6', '-v7.3'); 
    save('lambdas7.mat', 'lambdas7', '-v7.3'); 
    save('betas7.mat', 'betas7', '-v7.3'); 
    save('lambdas8.mat', 'lambdas8', '-v7.3'); 
    save('betas8.mat', 'betas8', '-v7.3'); 
    save('lambdas9.mat', 'lambdas9', '-v7.3'); 
    save('betas9.mat', 'betas9', '-v7.3'); 
    save('lambdas10.mat', 'lambdas10', '-v7.3'); 
    save('betas10.mat', 'betas10', '-v7.3'); 
    cd ..

    errornames=["full" "levonly" "levout" "cueonly"  "cueout" "responly" "respout"  "rewonly"   "rewout" "resp1only" "resp1out" "resp2only" "resp2out"];
    %mses=[fullmses levonlymses levoutmses cueonlymses  cueoutmses responlymses respoutmses  rewonlymses  rewoutmses resp1onlymses resp1outmses resp2onlymses resp2outmses];
    rsqs=[fullrsqs levonlyrsqs levoutrsqs  cueonlyrsqs cueoutrsqs  responlyrsqs  respoutrsqs rewonlyrsqs  rewoutrsqs resp1onlyrsqs resp1outrsqs resp2onlyrsqs resp2outrsqs];

    %errornames=["full", "levonly", "TRlevonly", "cueonly", "dur1only", "dur2only", "responly", "TRresponly", "rewonly", "TRrewonly", "levout", "TRlevout", "cueout", "dur1out", "dur2out", "respout", "TRrespout", "rewout", "TRrewout"];
    %mses=[fullmses levonlymses TRlevonlymses cueonlymses dur1onlymses dur2onlymses responlymses TRresponlymses rewonlymses r  levoutmses TRlevoutmses cueoutmses dur1outmses dur2outmses respoutmses TRrespoutmses rewoutmses TRrewoutmses];
    %rsqs=[fullrsqs levonlyrsqs TRlevonlyrsqs cueonlyrsqs dur1onlyrsqs dur2onlyrsqs responlyrsqs TRresponlyrsqs rewonlyrsqs r  levoutrsqs TRlevoutrsqs cueoutrsqs dur1outrsqs dur2outrsqs respoutrsqs TRrespoutrsqs rewoutrsqs TRrewoutrsqs];

    %error=[errornames; mses; rsqs; ];
    error=[errornames;  rsqs; ];

    %save('error.mat', 'error', '-v7.3'); 


    errornames=["TRlev" "TRcue" "TRresp"  "TRrew"];
    %mses=[fullmses TRlevmses TRcuemses TRrespmses  TRcuemses ];
    rsqs=[TRlevrsqs TRcuersqs  TRresprsqs TRrewrsqs ];

    %TRerror=[errornames; mses; rsqs];
    TRerror=[errornames;  rsqs];

    save('TRerror.mat', 'TRerror', '-v7.3'); 
    save('error.mat', 'error', '-v7.3'); 
    %these stats test full model against each reduced model
    statsnames=["lev" "cue" "resp" "rew"];
    stats=[];
    x=str2double(error(2:end,1));
    y=str2double(error(2:end, 3));
    z=ranksum(x, y);    levdiff=mean(x)-mean(y);
    stats=[stats z];
    y=str2double(error(2:end, 5));
    z=ranksum(x, y);    cuediff=mean(x)-mean(y);
    stats=[stats z];
    y=str2double(error(2:end, 7));
    z=ranksum(x, y);    respdiff=mean(x)-mean(y);
    stats=[stats z];
    y=str2double(error(2:end, 9));
    z=ranksum(x, y);    rewdiff=mean(x)-mean(y);
    stats=[stats z];
    diffs=[levdiff cuediff respdiff rewdiff];
    stats=[statsnames; stats; diffs];
    save('stats.mat', 'stats', '-v7.3'); 

    
    
    TRstats=[];
    y=str2double(TRerror(2:end, 1));
    z=ranksum(x, y);    TRlevdiff=mean(x)-mean(y);
    TRstats=[TRstats z];
    y=str2double(TRerror(2:end, 2));
    z=ranksum(x, y);    TRcuediff=mean(x)-mean(y);
    TRstats=[TRstats z];
    y=str2double(TRerror(2:end, 3));
    z=ranksum(x, y);    TRrespdiff=mean(x)-mean(y);
    TRstats=[TRstats z];    
    y=str2double(TRerror(2:end, 4));
    z=ranksum(x, y);    TRrewdiff=mean(x)-mean(y);
    TRstats=[TRstats z];
    TRdiffs=[TRlevdiff TRcuediff TRrespdiff TRrewdiff];
    TRstats=[statsnames; TRstats; TRdiffs];
    save('TRstats.mat', 'TRstats', '-v7.3'); 
   
    recerrormean=mean(str2double(error(2:end,:)));
    recTRerrormean=mean(str2double(TRerror(2:end,:)));
    recsem=std(str2double(error(2:end,:)))/sqrt(length(str2double(error(2:end,:))));
    recTRsem= std(str2double(TRerror(2:end,:)))/sqrt(length(str2double(TRerror(2:end,:))));
    %
    recerror=[recerror; recerrormean str2double(stats(2,:)) recsem recTRerrormean str2double(TRstats(2,:)) recTRsem];
        
    cd ..
end

save('recerrorNstats.mat', 'recerror', '-v7.3'); 

cd ..
clear;clc
end
