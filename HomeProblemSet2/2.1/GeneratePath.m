function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
%GeneratePath(pheromoneLevel, visibility, alpha, beta)

[nCities ~] = size(visibility);

startNode = randi(nCities);
taboList = [startNode];

for i = 1:nCities-1
nextNode = GetNode(taboList,pheromoneLevel, visibility, alpha, beta);
taboList = [taboList nextNode];
end


if length(unique(taboList)) == length(taboList)

path = taboList;
end
end

