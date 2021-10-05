function nextNode = GetNode(taboList,pheromoneLevel, visibility, alpha, beta)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
j = taboList(end);
pheromoneLevel;
visibility;

p = zeros(1,50);

for l = 1:50
    if ismember(l,taboList)
        down(l) = 0;
    else
        down(l) = pheromoneLevel(l,j)^alpha*visibility(l,j)^beta;
    end
end
down = sum(down);

for i = 1:50
    if ismember(i,taboList)
        p(i) = 0;
    else
        p(i) = pheromoneLevel(i,j)^alpha*visibility(i,j)^beta/down;
    end
end

r = rand;
probSum=0;
k = round(sum(p),5);
if (k ~= 1)
    error("Probsum not equal to 1")
end

for i = 1:length(p)
    probSum = probSum+p(i);
    if probSum>r
        probSum;
        i;
        break
    end
end

nextNode = i;

end

