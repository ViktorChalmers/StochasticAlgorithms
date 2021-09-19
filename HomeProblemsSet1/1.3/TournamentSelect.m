
function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
"start";
tmpFitnessList = fitnessList(randi(length(fitnessList),1,tournamentSize));

for i = 1:length(tmpFitnessList)-1
    r = rand(1);
    if r < tournamentProbability
        "break";
        selectedIndividual = max(tmpFitnessList);
        
        break
    else
        [maxi index] = max(tmpFitnessList);
        tmpFitnessList(index) = [];
    end
end

if(length(tmpFitnessList)==1)
    selectedIndividual = tmpFitnessList;
end


find(fitnessList == selectedIndividual);
selectedIndividual;
selectedIndividualIndex = find(fitnessList == selectedIndividual);

if length(selectedIndividualIndex) > 1
   selectedIndividualIndex = selectedIndividualIndex(randi([1,length(selectedIndividualIndex)]));
end
if(selectedIndividualIndex> 100)
    "error";
end
"complete";
end