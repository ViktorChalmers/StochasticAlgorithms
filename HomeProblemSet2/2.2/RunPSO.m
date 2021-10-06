hold on
x = linspace(-5,5);
y = linspace(-5,5);
[X,Y] = meshgrid(x,y);
a = 1
Z = (X.^2+Y-11).^2 + (X+Y.^2-7).^2;
subplot(2,2,1)
contour(X,Y,Z);

subplot(2,2,2)
surf(X,Y,Z);

Z = log(a+Z);
subplot(2,2,3)
contour(X,Y,Z);

subplot(2,2,4)
%%
clf

x = linspace(-5,5);
y = linspace(-5,5);
[X,Y] = meshgrid(x,y);
a = 1
Z = (X.^2+Y-11).^2 + (X+Y.^2-7).^2;
%hold all
Z = log(a+Z);
contour(X,Y,Z);
%scatter3(positions(:,1),positions(:,2),"*")
hold on
plotParticles(swarmBest,f)
hold off

%%
clc,clear
f =@(x1,x2) (x1^2+x2-11)^2+(x1+x2^2-7)^2;
%InitializePlot(f)
% Constants

cognetiveConstant = 2;
socialConstant = 2;
numberOfParticles = 20;
dimensions = 2;
alpha = 1;
deltaTime = 1;
swarmBest = [NaN NaN];
particleBest = NaN(numberOfParticles,2);
weight = 1.4;
iteration = 0;
positionRange = [-5 5];
[positions velocities] = InitializeParticles(numberOfParticles,dimensions,positionRange,alpha,deltaTime);

while(iteration<100000)
    iteration = iteration + 1;
    
    [particleBest swarmBest] = updateBestPosition(positions,f,particleBest,swarmBest);
    [position velocities] = updateParticles(positions,velocities,weight,cognetiveConstant,socialConstant,deltaTime,particleBest,swarmBest);
    
    if weight>0.4
        weight = weight*0.7
    end
    
    
    clf
    
    x = linspace(-5,5);
    y = linspace(-5,5);
    [X,Y] = meshgrid(x,y);
    a = 1;
    Z = (X.^2+Y-11).^2 + (X+Y.^2-7).^2;
    %hold all
    Z = log(a+Z);
    contour(X,Y,Z);
    %scatter3(positions(:,1),positions(:,2),"*")
    hold on
    plotParticles(particleBest,f)
    hold off
    iteration;
    pause(0.1)
    
    
end