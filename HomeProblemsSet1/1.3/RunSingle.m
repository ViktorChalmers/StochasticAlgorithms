%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc,clear
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change: (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;  	   % Do NOT change

tournamentSize = 2;                % Changes allowed
tournamentProbability = 0.75;      % Changes allowed (= pTour)
crossoverProbability = 0.8;        % Changes allowed (= pCross)
mutationProbability = 0.02;        % Changes allowed. (Note: 0.02 <=> 1/numberOfGenes)
numberOfGenerations = 2000;        % Changes allowed.

numberOfRuns = 10;
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
        tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    
    sprintf('Fitness: %d, x(1): %0.10f, x(2): %0.10f', maximumFitness, bestVariableValues(1), bestVariableValues(2))
    fitness(i,1) = maximumFitness;
    x1(i,1) = bestVariableValues(1);
    x2(i,1) = bestVariableValues(2);
end

mean(fitness)

T = table(fitness,x1,x2);