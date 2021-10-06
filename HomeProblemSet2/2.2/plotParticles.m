function pl = plotParticles(positions,f)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

X = positions(:,1);
Y = positions(:,2);

for i = 1:length(positions(:,1))
    Z(i,1) = f(X(i,:),Y(i,:));
end

plot3(X,Y,Z,"*")

end