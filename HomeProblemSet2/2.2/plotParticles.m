function pl = plotParticles(positions,f)
%plotParticles(positions,f)

X = positions(:,1);
Y = positions(:,2);

for i = 1:length(positions(:,1))
    Z(i,1) = f(X(i,:),Y(i,:));
end

plot3(X,Y,log(1+Z),"o")

end