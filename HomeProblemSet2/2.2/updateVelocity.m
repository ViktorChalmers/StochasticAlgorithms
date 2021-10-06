function velocities = updateVelocity(velocities,positions,weight,cognetiveConstant,socialConstant,deltaTime,particleBest,swarmBest)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
vmax = 4;
N = length(positions(:,1));
n = length(positions(1,:));
x = positions;
c1 = cognetiveConstant;
c2 = socialConstant;
w = weight;
v = velocities;
dt = deltaTime;
xpb = particleBest;
xsb = swarmBest;
nextVel = zeros(N,n);

for i = 1:N
    q = rand;
    r = rand;
    for j = 1:n
        cognetiveTerm = c1*q*((xpb(i,j)-(x(i,j)))/dt);
        socialTerm = c2*r*((xsb(j)-(x(i,j)))/dt);
        nextVel(i,j) = weight*v(i,j) + cognetiveTerm + socialTerm;
        if abs(nextVel(i,j))>vmax
            nextVel(i,j) = sign(nextVel(i,j))*vmax;
        end
    end
end
velocities = nextVel;

end
