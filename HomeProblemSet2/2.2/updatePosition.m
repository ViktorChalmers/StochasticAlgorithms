function positions = updatePosition(velocities,positions,deltaTime)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
[N n] = size(positions);
for i =1:N
    for j = 1:n
        x(i,j) = positions(i,j)+velocities(i,j)*deltaTime;
        if abs(x(i,j))>5
            x(i,j) = sign(x(i,j))*5;
        end
    end
end

positions = x;
end

