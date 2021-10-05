function nij = GetVisibility(cityLocation)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%d = zeros(50)
for i = 1:50
    for j = 1:50
        
        d(i,j) = 1/norm(cityLocation(i,:)-cityLocation(j,:));
        
    end
end
nij = d;
end

