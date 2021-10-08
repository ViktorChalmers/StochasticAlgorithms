function pathLength = GetPathLength(path,cityLocation)
%GetPathLength(path,cityLocation)

length = norm(cityLocation(path(1),:)-cityLocation(path(end),:));
[t nCities] = size(path);
tmpPath = path;

for i = 1:nCities-1
    currentNode = tmpPath(1);
    nextNode = tmpPath(2);
    length = length + norm(cityLocation(currentNode,:)-cityLocation(nextNode,:));
    tmpPath(1) = [];
end

pathLength = length;
end




