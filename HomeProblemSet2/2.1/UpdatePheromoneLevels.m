function PheromoneLevels = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

nextPhermoneLevel = pheromoneLevel*(1-rho) + deltaPheromoneLevel;

PheromoneLevels = nextPhermoneLevel;
end

