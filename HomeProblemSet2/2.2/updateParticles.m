function [positions velocities] = updateParticles(positions,velocities,weight,cognetiveConstant,socialConstant,deltaTime,particleBest,swarmBest)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

v = updateVelocity(velocities,positions,weight,cognetiveConstant,socialConstant,deltaTime,particleBest,swarmBest);
x = updatePosition(velocities,positions,deltaTime);

positions = x;
velocities = v;

end

