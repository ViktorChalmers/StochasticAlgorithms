function nextNode = GetNode(taboList,pheromoneLevel, visibility, alpha, beta)
%GetNode(taboList,pheromoneLevel, visibility, alpha, beta)

currentNode = taboList(end);

[nCities ~] = size(visibility);

probability = zeros(1,nCities);

for l = 1:nCities
    if ismember(l,taboList)
        denominator(l) = 0;
    else
        denominator(l) = pheromoneLevel(l,currentNode)^alpha*visibility(l,currentNode)^beta;
    end
end

denominatorSum = sum(denominator);

for i = 1:nCities
    if ismember(i,taboList)
        probability(i) = 0;
    else
        probability(i) = pheromoneLevel(i,currentNode)^alpha*visibility(i,currentNode)^beta/denominatorSum;
    end
end

r = rand;
probSum=0;
k = round(sum(probability),5);

if (k ~= 1)
    error("Probsum not equal to 1")
end

for pNextNode = 1:length(probability)
    probSum = probSum+probability(pNextNode);
    if probSum>r
        break
    end
end

nextNode = pNextNode;

end

