function positions = updatePosition(velocities,positions,deltaTime)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
[N n] = size(positions);
for i =1:N
    for j = 1:n
        x(i,j) = positions(i,j)+velocities(i,j)*deltaTime;
    end
end

positions = x;
end

