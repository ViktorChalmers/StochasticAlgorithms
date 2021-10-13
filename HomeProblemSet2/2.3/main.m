clc,clear,clf
popSize = 100;

nGenerations = 1000;
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
nGenes = (nHidden)*(nIn+1) + nOut*(nHidden+1)
mutationProbability = 1/nGenes;

[maximumFitness, bestWIH, bestWHO,maxfitValArr,maxfitArr,ge] = RunFFNNOPT(popSize,nGenes,nGenerations,tournamentSize,...
    tournamentProbability, crossoverProbability, mutationProbability,nSlopes,iDataSet,nIn, nHidden, nOut, wMax);

%%
[fit le] = EvaluateIndividual(bestWIH, bestWHO,10,1)
chr = EncodeNetwork(bestWIH, bestWHO, wMax);