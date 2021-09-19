function mutatedIndividual = Mutate(individual, mutationProbability)
numberOfGenes = length(individual);

for i = 1:length(individual)
    r = rand(1);
    if (r<mutationProbability)
        mutatedIndividual(i) = 1-individual(i);
    else
        mutatedIndividual(i) = individual(i);
    end
end

end
