%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc,clear
numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;             % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define more runs here (pMut < 0.02) ...

mutationProbability = linspace(0,0.02,10)
h = waitbar(0,"init")
for iteration = 1:length(mutationProbability)
sprintf('Mutation rate = %0.5f', mutationProbability(iteration))
maximumFitnessList002 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability(iteration), numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList002(i,1) = maximumFitness;
end

waitbar(iteration/length(mutationProbability),h,"loading")
iteration
average002(iteration) = mean(maximumFitnessList002);
median002(iteration) = median(maximumFitnessList002);
std002(iteration) = sqrt(var(maximumFitnessList002));
sprintf('PMut = 0.02: Median: %0.10f, Average: %0.10f, STD: %0.10f', median002(iteration), average002(iteration), std002(iteration))
end
%%

plot(mutationProbability,median002)
xlabel("Mutation probability p_{mut}")
ylabel("Median performance ")
title("Performance plot")
grid on

t = table(mutationProbability,median002,'VariableNames',["Mutation probability" "Median"])

% ... and here (pMut > 0.02)