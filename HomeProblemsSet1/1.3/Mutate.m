% function mutatedIndividual = Mutate(individual, mutationProbability)
% numberOfGenes = length(individual);
% mutatedIndividual = individual;
% for i = 1:numberOfGenes
%     r = rand;
%     if (r<mutationProbability)
%         mutatedIndividual(i) = 1-individual(i);
%     end
% end
% end
function mutatedIndividual = Mutate(individual, mutationProbability)
   mutatedIndividual = individual;
   nGenes = size(individual,2);
 
  for j = 1:nGenes
       r = rand;
       if r < mutationProbability
           mutatedIndividual(j) = 1-individual(j);
       end
  end

end