function [positions,velocities] = InitializeParticles(numberOfParticles,dimensions,positionRange,alpha,deltaTime)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N = numberOfParticles;
n = dimensions;
xmin = positionRange(1);
xmax = positionRange(2);

x = zeros(numberOfParticles,dimensions);
v = zeros(numberOfParticles,dimensions);

for j = 1:n
    for i = 1:numberOfParticles
        r = rand;
        x(i,j) = xmin+r*(xmax-xmin);
        r = rand;
        v(i,j) = alpha/deltaTime*(-(xmax-xmin)/2 + r*(xmax-xmin));
    end
end

positions = x;
velocities = v;
end

