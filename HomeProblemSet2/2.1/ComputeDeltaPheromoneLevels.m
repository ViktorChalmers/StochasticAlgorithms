function deltaPhermone = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
deltaPhermone = zeros(50);


for k = 1:50
    tmpPath = pathCollection(k,:);
    
    for i = 1:49
        currentNode = tmpPath(i);
        nextNode = tmpPath(i+1);
        deltaPhermone(nextNode,currentNode) = deltaPhermone(nextNode,currentNode) + 1/pathLengthCollection(k);
    end
end


end

