clc,clear,clf
%Declara function
f =@(x1,x2) (x1^2+x2-11)^2+(x1+x2^2-7)^2;

cognetiveConstant = 2;
socialConstant = 2;
numberOfParticles = 20;
dimensions = 2;
alpha = 0.5;
deltaTime = 1;
swarmBest = [NaN NaN];
particleBest = NaN(numberOfParticles,2);
weight = 1.4;
iteration = 0;
positionRange = [-5 5];
thresHold = 100

bestFunctionValue = inf

[positions velocities] = InitializeParticles(numberOfParticles,dimensions,positionRange,alpha,deltaTime);
counter = 0;
while(counter<100)
    iteration = iteration + 1;
   
    
    [particleBest swarmBest] = updateBestPosition(positions,f,particleBest,swarmBest);
    [positions velocities] = updateParticles(positions,velocities,weight,cognetiveConstant,socialConstant,deltaTime,particleBest,swarmBest);
    
    if weight>0.3
        weight = weight*0.7;
    end
    
    subplot(1,2,1)
    plotFunction(f,positionRange,"surf","log",alpha);
    hold on
    plotParticles(particleBest,f);
    plotParticles(swarmBest,f);
    hold off

    subplot(1,2,2)
    plotFunction(f,positionRange,"contour","log",alpha);
    hold on
    plotParticles(particleBest,f);
    plotParticles(swarmBest,f);
    hold off
   
    pause(0.1)
    
    
    if bestFunctionValue == f(swarmBest(1),swarmBest(2))
        counter = counter + 1;
    else
        counter = 0;
    end
    
    if f(swarmBest(1),swarmBest(2)) < bestFunctionValue;
        bestFunctionValue = f(swarmBest(1),swarmBest(2));
        disp(sprintf('best position found, (x,y) =  (%.3f,%.3f), f(x,y) = %.4f,',swarmBest,bestFunctionValue))
    end
    
    
end
disp(sprintf('Stopped at %.0d iterations',iteration))

%%

    clf
    plotFunction(f,positionRange,"surf","log",alpha);

    hold on
    plotParticles(particleBest,f);
    plotParticles(swarmBest,f);
    hold off