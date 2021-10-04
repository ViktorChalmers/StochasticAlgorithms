clc
taboList = [48 44]
nextNode = GetNode(taboList,pheromoneLevel, visibility, alpha, beta);
function nextNode = GetNode(taboList,pheromoneLevel, visibility, alpha, beta)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

v = 50-length(taboList)
standingNode = taboList(end)
i = standingNode

for j = 1:50
    if ismember(j,taboList)
        p(j) = 0;
    else
    p(j) = pheromoneLevel(i,j)*visibility(i,j)/(v*pheromoneLevel(i,j)*visibility(i,j));
    end
end

nextNode = p;

end

