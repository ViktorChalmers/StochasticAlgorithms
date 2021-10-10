function [maximumFitness, bestWIH, bestWHO] =  RunFFNNOPT(popSize,nGenes,nGenerations,tournamentSize,...
    tournamentProbability, crossoverProbability, mutationProbability,iSlope,iDataSet,nIn, nHidden, nOut, wMax)

maximumFitness  = 0;
population = InitializePopulation(popSize,nGenes);

for gen = 1:nGenerations
    maximumFitness  = 0.0;
    fitnessList = zeros(popSize);
    for i = 1:popSize
        chromosome = population(i,:);
        [wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax);
        [fitnessList(i) x(i)] = EvaluateIndividual(wIH, wHO,iSlope,iDataSet);
        if (fitnessList(i) > maximumFitness )
            maximumFitness  = fitnessList(i);
            iBestIndividual = i;
            bestWIH = wIH;
            bestWHO = wHO;
            bestLength = x(i);
        end
    end
    
    temporaryPopulation = population;
    for i = 1:2:popSize
        i1 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        i2 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        
        r = rand;
        if (r < crossoverProbability)
            individual1 = population(i1,:);
            individual2 = population(i2,:);
            newIndividualPair = Cross(individual1, individual2);
            temporaryPopulation(i,:) = newIndividualPair(1,:);
            temporaryPopulation(i+1,:) = newIndividualPair(2,:);
        else
            temporaryPopulation(i,:) = population(i1,:);
            temporaryPopulation(i+1,:) = population(i2,:);
        end
    end
    
    temporaryPopulation(1,:) = population(iBestIndividual,:);
    for i = 2:popSize
        tempIndividual = Mutate(temporaryPopulation(i,:),mutationProbability);
        temporaryPopulation(i,:) = tempIndividual;
    end
    population = temporaryPopulation;
    
end
bestLength
end