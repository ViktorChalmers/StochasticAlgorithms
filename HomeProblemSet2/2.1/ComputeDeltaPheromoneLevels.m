function deltaPhermone = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);
%ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)

[nCities ~] = size(pathCollection);

deltaPhermone = zeros(nCities);


for k = 1:nCities
    tmpPath = pathCollection(k,:);
    
    for i = 1:nCities-1
        currentNode = tmpPath(i);
        nextNode = tmpPath(i+1);
        deltaPhermone(nextNode,currentNode) = deltaPhermone(nextNode,currentNode) + 1/pathLengthCollection(k);
    end
end


end

