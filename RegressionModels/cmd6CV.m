% Parameters

dataSize = length(dep);  % Size of your dataset
foldSize = floor(dataSize / fold);  % Size of each fold

% Initialize arrays to store results
lambdas = cell(1, fold);
betas = zeros(fold, size(eX,2)+1, cells);%cell(1, fold);
convergenceFailures = cell(1, fold);
rsqs = zeros(fold, cells);%cell(1, fold);
reals = cell(1, fold);
ybars = cell(1, fold);
tests = cell(1, fold);

for i = 1:fold
    % Randomly permute the data to split into 70-30 for training-testing
    cv = cvpartition(dataSize, 'HoldOut', 0.3);  % 30% test, 70% train
    
    % Training sets
    depTrain = dep(training(cv), :);  % 70% of dep for training
    eXTrain = eX(training(cv), :);    % 70% of eX for training
    
    % Testing sets
    depTest = dep(test(cv), :);  % 30% of dep for testing
    eXTest = eX(test(cv), :);    % 30% of eX for testing
    
    % Run ridge regression (or any model you're using)
    [lambdas{i}, betas(i, :, :), convergenceFailures{i}] = ridgeMML(depTrain, eXTrain, [,0]);
    
    % Store test results
    reals{i} = depTest;
    ybars{i} = mean(depTest);  % Mean of the actual test data
    tests{i} = eXTest;
    
    % Predict the values on the test set using the model
    depPred = eXTest * squeeze(betas(i,2:end,:))+squeeze(betas(i,1,:))';  % Use the betas from ridge regression
    
    % Calculate R-squared value for this fold
    SS_res = sum((depTest - depPred).^2);  % Residual sum of squares
    SS_tot = sum((depTest - mean(depTest)).^2);  % Total sum of squares
    rsqs(i,:) = ones(1,cells) - SS_res ./ SS_tot;  % R-squared formula
end

