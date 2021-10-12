clc,clear,clf
% nh = 2:2:10
% for i = 1:length(nh)
popSize = 100;

nGenerations = 30;
tournamentSize = 2;
tournamentProbability = 2;
crossoverProbability = 0.2;
mutationProbability = 0.02;
nSlopes = 10;
iDataSet = 1;
nIn = 3;
nHidden = 8;
nOut = 2;
wMax = 5;
nGenes = (nHidden)*(nIn+1) + nOut*(nHidden+1);
mutationProbability = 1/nGenes;

[maximumFitness, bestWIH, bestWHO] = RunFFNNOPT(popSize,nGenes,nGenerations,tournamentSize,...
    tournamentProbability, crossoverProbability, mutationProbability,nSlopes,iDataSet,nIn, nHidden, nOut, wMax);
%fitval(i) = maximumFitness
% end
% 
% clf
% plot(nh,fitval)
%%
[fit le] = EvaluateIndividual(wIH, wHO,10,1)
BestChromosome = EncodeNetwork(wIH, wHO, wMax);