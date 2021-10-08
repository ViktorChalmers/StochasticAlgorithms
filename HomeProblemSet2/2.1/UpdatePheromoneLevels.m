function updatedPheromoneLevels = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho)
%UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho)

updatedPheromoneLevels = pheromoneLevel*(1-rho) + deltaPheromoneLevel;

end

