function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

startNode = randi(50);
taboList = [startNode];

for i = 1:49
nextNode = GetNode(taboList,pheromoneLevel, visibility, alpha, beta);
taboList = [taboList nextNode];
end


if length(unique(taboList)) == length(taboList)

path = taboList;
end
end

