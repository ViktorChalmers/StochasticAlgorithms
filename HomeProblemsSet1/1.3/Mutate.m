
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