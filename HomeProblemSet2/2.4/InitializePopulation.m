
function population = InitializePopulation(populationSize,minChromosomeLength,maxChromosomeLength);

population = [];
le = minChromosomeLength:4:maxChromosomeLength
    index = randi([1 length(le)]);
    chromosomeLength = le(index)
for i = 1:populationSize
    index = randi([1 length(le)]);
    chromosomeLength = le(index)
    %chromosomeLength = minChromosomeLength + fix(rand*(maxChromosomeLength-minChromosomeLength+1));
    tmpChromosome = fix(2*rand(chromosomeLength,1));
    tmpIndividual = struct('Chromosome',tmpChromosome);
    population = [population tmpIndividual];
end
end