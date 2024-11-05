
shuffler =(randperm(size(eX, 1))');

orderedArray=[shuffler eX];
%[r c] = size(orderedArray);

shuffledArray=sortrows(orderedArray);  %I checked that sum of shuff==sum of ord

%shuffledArray(:,:)=[];%%%%%%%%

%save('shuffledArray.mat', 'shuffledArray', '-v7.3');

shuffledeX=shuffledArray(:, 2:end);

%or below, to scramble each var separately
%shuffledeX=[]
%for i=1:size(eX, 2)
%    shuffler =(randperm(size(eX, 1))');
%    orderedArray=[shuffler eX(:, i)];
%    shuffledArray=sortrows(orderedArray);
%    shuffledeX(:, i)=shuffledArray(:, 2);
%end


%save('shuffledeX.mat', 'shuffledeX', '-v7.3');
