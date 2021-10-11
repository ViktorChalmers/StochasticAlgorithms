function mutatedIndividual = Mutate(individual, mutationProbability)
mutatedIndividual = individual;
nGenes = size(individual,2);
Cr = 0.15*2*5;
for j = 1:nGenes
    r = rand;
    if r < mutationProbability
%         mutatedIndividual(j) = 1-individual(j);
        mutatedIndividual(j) = individual(j)-Cr/2+Cr*r;
    end
end

end