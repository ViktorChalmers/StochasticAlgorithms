function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)

tmpFitnessList = fitnessList(randi(length(fitnessList),1,tournamentSize));
tmpFitnessList = sort(tmpFitnessList,'descend');
selectedIndividual = tmpFitnessList(end);

for i = 1:length(tmpFitnessList)-1
    r = rand;
    if r<tournamentProbability
        selectedIndividual = tmpFitnessList(i);
        break
    end
end

selectedIndividualIndex = find(fitnessList == selectedIndividual);
if length(selectedIndividualIndex) > 1
   selectedIndividualIndex = selectedIndividualIndex(randi([1,length(selectedIndividualIndex)]));
end

end