function visability = GetVisibility(cityLocation)
%GetVisibility(cityLocation)
nCities = length(cityLocation(:,1));
nij = zeros(nCities);

for i = 1:nCities
    for j = 1:nCities
        
        nij(i,j) = 1/norm(cityLocation(i,:)-cityLocation(j,:));
        
    end
end

visability = nij;

end

