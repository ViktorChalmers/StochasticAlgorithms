function pathLength = GetPathLength(path,cityLocation)

length = 0;

tmpPath = path;

for i = 1:49
    currentNode = tmpPath(1);
    nextNode = tmpPath(2);
    length = length + norm(cityLocation(currentNode,:)-cityLocation(nextNode,:));
    tmpPath(1) = [];
end

pathLength = length + norm(cityLocation(end,:)-cityLocation(1,:));
end

