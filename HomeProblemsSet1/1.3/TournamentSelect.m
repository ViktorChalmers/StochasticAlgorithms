
function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)

tmpIndex = 1 + fix(rand(1,3)*length(fitnessList));


tmpFitnessList = fitnessList(tmpIndex);


[minimumFitness,minIndex] = min(tmpFitnessList);
selectedIndividualIndex = tmpIndex(minIndex);
for i = 1:tournamentSize-1
    [maximumFitness,maxIndex] = max(tmpFitnessList);
    r = rand;
    if r<tournamentProbability
        selectedIndividualIndex = tmpIndex(maxIndex);
        break
    else
        tmpIndex(maxIndex) = [];
        tmpFitnessList(maxIndex) = [];
    end
end

end
