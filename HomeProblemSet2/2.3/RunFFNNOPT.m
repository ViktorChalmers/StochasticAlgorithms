function [maximumFitness, bestWIH, bestWHO] =  RunFFNNOPT(popSize,nGenes,nGenerations,tournamentSize,...
    tournamentProbability, crossoverProbability, mutationProbability,nSlopes,iDataSet,nIn, nHidden, nOut, wMax)

fitnessValidation = 0
population = InitializePopulation(nGenes,popSize);
wBar = waitbar(0,"init");
for gen = 1:nGenerations
    waitbar(gen/nGenerations,wBar,"Loading ..." + gen/nGenerations*100);
    maximumFitness  = 0.0;
    fitnessList = zeros(popSize,1);
    for i = 1:popSize
        chromosome = population(i,:);
        [wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax);
        [fitnessList(i) x(i)] = EvaluateIndividual(wIH, wHO,nSlopes,iDataSet);
        if (fitnessList(i) > maximumFitness-1 )
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
    NextfitnessValidation = EvaluateIndividual(bestWIH, bestWHO,5,3)
%     if NextfitnessValidation<0.8*fitnessValidation
%         break
%     else
        fitnessValidation=NextfitnessValidation
%     end
    maximumFitness
    hold on
    plot(gen,maximumFitness,"o")
    plot(gen,fitnessValidation,"o")
end
close(wBar)
end
