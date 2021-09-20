
function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)

fitness = fitnessList;
pTournament = tournamentProbability;
populationSize = length(fitness);
iTmp1 = 1 + fix(rand*populationSize);
iTmp2 = 1 + fix(rand*populationSize);

r = rand;

if (r < pTournament)
    if (fitness(iTmp1) > fitness(iTmp2))
        selectedIndividualIndex = iTmp1;
    else
        selectedIndividualIndex = iTmp2;
    end
else
    if (fitness(iTmp1) > fitness(iTmp2))
        selectedIndividualIndex = iTmp2;
    else
        selectedIndividualIndex = iTmp1;
    end
end

end


% function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
% 
% tmpFitnessList = fitnessList(randi(length(fitnessList),1,tournamentSize));
% tmpFitnessList = sort(tmpFitnessList,'descend');
% selectedIndividual = tmpFitnessList(end);
% 
% for i = 1:length(tmpFitnessList)-1
%     r = rand;
%     if r<tournamentProbability
%         selectedIndividual = tmpFitnessList(i);
%         break
%     end
% end
% 
% selectedIndividualIndex = find(fitnessList == selectedIndividual);
% if length(selectedIndividualIndex) > 1
%    selectedIndividualIndex = selectedIndividualIndex(randi([1,length(selectedIndividualIndex)]));
% end
% end