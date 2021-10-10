clc,clear

BRAKE_TEMPERATURE_MAX = 750;
ENGINE_BRAKE = 3000;
BRAKE_CONSTNAT = 40;
mass = 20000;
tAmbient = 283;
velocityMax = 25;
alphaMax = 10;
tau = 30;
deltaTime = 0.25;

nIn = 3;
nHidden = 3;
nOut = 2;
wMax = 4;

iSlope = 1;
iDataSet = 1;
population = randi(2,20,20);
population(population == 2) = -1;

[nGenes populationSize] = size(population);

maximumFitness = 0;
tournamentProbability = 0.8;
tournamentSize = 10;
crossoverProbability = 0.2;
mutationProbability  = 0.2;

tournamentSize = 2;                % Changes allowed
tournamentProbability = 0.75;      % Changes allowed (= pTour)
crossoverProbability = 0.8;        % Changes allowed (= pCross)
mutationProbability = 0.02;        % Changes allowed. (Note: 0.02 <=> 1/numberOfGenes)

numberOfGenerations = 10;
for iGeneration = 1:numberOfGenerations
for i = 1:20
    
    chromosome = population(:,i);
    
    
    brakePressure = 0;
    velocity = 20;
    x = 0;
    gear = 7;
    brakeTemperature = 500;
    gearChange=0;
    alpha = GetSlopeAngle(x, iSlope, iDataSet);
    
    fitness = RunFFNNOptimization(chromosome,brakePressure,velocity,x,gear,brakeTemperature,gearChange,alpha, ...
        iSlope,iDataSet,velocityMax,alphaMax,BRAKE_TEMPERATURE_MAX,nIn,nOut,nHidden,wMax,BRAKE_CONSTNAT,tAmbient,deltaTime,ENGINE_BRAKE,mass);
    %
    %     iteration = 0;
    %     condition  = true;
    %     while(condition)
    %         iteration = iteration+1;
    %
    %         savedVel(iteration) = velocity;
    %
    %         input = [velocity/velocityMax alpha/alphaMax brakeTemperature/BRAKE_TEMPERATURE_MAX]';
    %
    %         [gearChange brakePressure] = RunFFNN(input,wIH,wHO);
    %
    %         gear = UpdateGear(gear,gearChange);
    %         brakeTemperature = UpdateBrakeTemperature(brakeTemperature,brakePressure,BRAKE_CONSTNAT,tAmbient);
    %         x = x + velocity*deltaTime;
    %         alpha = GetSlopeAngle(x, iSlope, iDataSet);
    %         velocity = CalculateVelocity(velocity,deltaTime,alpha,gear,brakePressure,ENGINE_BRAKE,brakeTemperature,BRAKE_TEMPERATURE_MAX,mass);
    %
    %        [condition type value] = checkConstraints(velocity/velocityMax,alpha/alphaMax,brakeTemperature/BRAKE_TEMPERATURE_MAX,brakePressure,gear);
    %     end
    %
    %     value;
    %     fitness = mean(savedVel)*x;
    fitnessList(i) = fitness;
    %disp(sprintf("" + type + " = %0.1f, Finesscore = %0.0f, iteration = %d, length = %0.1f, brakeTemperature = %0.0f",value,fitness,iteration,x,brakeTemperature))
    
    
    if (fitnessList(i) > maximumFitness )
        maximumFitness  = fitnessList(i);
        iBestIndividual = i;
        bestLength = x
    end
end

temporaryPopulation = population;
for i = 1:2:populationSize
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
for i = 2:populationSize
    tempIndividual = Mutate(temporaryPopulation(i,:),mutationProbability);
    temporaryPopulation(i,:) = tempIndividual;
end
maximumFitness;
population = temporaryPopulation;
end


iBestIndividual
bestLength
maximumFitness
fitnessList;
max(fitnessList)
%%
clc,clear
popSize = 20;

nGenerations = 10;
tournamentSize = 2;
tournamentProbability = 0.7;
crossoverProbability = 0.2;
mutationProbability = 0.02;
iSlope = 1;
iDataSet = 1;
nIn = 3;
nHidden = 3;
nOut = 2;
wMax = 5;
nGenes = (nHidden)*(nIn+1) + nOut*(nHidden+1);

[maximumFitness, bestWIH, bestWHO] = RunFFNNOPT(popSize,nGenes,nGenerations,tournamentSize,...
    tournamentProbability, crossoverProbability, mutationProbability,iSlope,iDataSet,nIn, nHidden, nOut, wMax)