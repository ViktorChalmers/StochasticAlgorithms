% clc,clear
% fit = [1 1 1 1];
% index = TournamentSelect(fit,0.9,2);
% fit(index);
function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)

tmpIndex = 1 + fix(rand(1,3)*length(fitnessList));
%tmpIndex = randi(length(fitnessList),1,tournamentSize)

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
% function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
%
% tmpFitnessList = fitnessList(randi(length(fitnessList),1,tournamentSize));
% tmpFitnessList = sort(tmpFitnessList,'descend')
% selectedIndividual = tmpFitnessList(end);
%
% for i = 1:length(tmpFitnessList)-1
%     r = rand;
%     if r<tournamentProbability
%         selectedIndividual = tmpFitnessList(i)
%         break
%     end
% end
%
% selectedIndividualIndex = find(fitnessList == selectedIndividual);
% if length(selectedIndividualIndex) > 1
%    selectedIndividualIndex = selectedIndividualIndex(randi([1,length(selectedIndividualIndex)]));
% end
%
% end

% function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
%
% fitness = fitnessList;
% pTournament = tournamentProbability;
% populationSize = length(fitness);
% iTmp1 = 1 + fix(rand*populationSize);
% iTmp2 = 1 + fix(rand*populationSize);
%
% r = rand;
%
% if (r < pTournament)
%     if (fitness(iTmp1) > fitness(iTmp2))
%         selectedIndividualIndex = iTmp1;
%     else
%         selectedIndividualIndex = iTmp2;
%     end
% else
%     if (fitness(iTmp1) > fitness(iTmp2))
%         selectedIndividualIndex = iTmp2;
%     else
%         selectedIndividualIndex = iTmp1;
%     end
% end
%
% end
% fit = [1 1 1 1]
% index = TournamentSelect(fit,0.9,2)
% fit(index)
% function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize);
% 
%     populationSize = length(fitnessList);
%     tournamentFitnessList = zeros(tournamentSize,1);
% 
%     for j=1:tournamentSize
%         randIndex(j) = 1 + fix(rand*populationSize);
%         tournamentFitnessList(j) = fitnessList(randIndex(j));
%     end
%     for i=1:tournamentSize
% 
%         r=rand;
%         [~, index] = max(tournamentFitnessList)
% 
%         if r < tournamentProbability
%             selectedIndividualIndex = randIndex(index(1));
%             break;
% 
%         elseif length(tournamentFitnessList)==1
%             selectedIndividualIndex = randIndex(index(1));
%             break;
%         else
%             tournamentFitnessList(index(1))=[];
% 
%         end
% 
%     end
% 
% end