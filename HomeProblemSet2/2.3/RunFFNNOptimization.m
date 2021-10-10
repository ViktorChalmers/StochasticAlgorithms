function fitness = RunFFNNOptimization(chromosome,brakePressure,velocity,x,gear,brakeTemperature,gearChange,alpha, ...
    iSlope,iDataSet,velocityMax,alphaMax,BRAKE_TEMPERATURE_MAX,nIn,nOut,nHidden,wMax,BRAKE_CONSTNAT,tAmbient,deltaTime,ENGINE_BRAKE,mass)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
brakePressure = 0;
velocity = 20;
x = 0;
gear = 7;
brakeTemperature = 500;
gearChange=0;
alpha = GetSlopeAngle(x, iSlope, iDataSet);
[wIH wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax);



iteration = 0;
condition  = true;
while(condition)
    iteration = iteration+1;
    
    savedVel(iteration) = velocity;
    
    input = [velocity/velocityMax alpha/alphaMax brakeTemperature/BRAKE_TEMPERATURE_MAX]';
    
    [gearChange brakePressure] = RunFFNN(input,wIH,wHO);
    
    gear = UpdateGear(gear,gearChange);
    brakeTemperature = UpdateBrakeTemperature(brakeTemperature,brakePressure,BRAKE_CONSTNAT,tAmbient);
    x = x + velocity*deltaTime;
    alpha = GetSlopeAngle(x, iSlope, iDataSet);
    velocity = CalculateVelocity(velocity,deltaTime,alpha,gear,brakePressure,ENGINE_BRAKE,brakeTemperature,BRAKE_TEMPERATURE_MAX,mass);
    
    [condition type value] = checkConstraints(velocity/velocityMax,alpha/alphaMax,brakeTemperature/BRAKE_TEMPERATURE_MAX,brakePressure,gear);
end

value;
    fitness = mean(savedVel)*x;
    %fitnessList(i) = fitness;
    disp(sprintf("" + type + " = %0.1f, Finesscore = %0.0f, iteration = %d, length = %0.1f, brakeTemperature = %0.0f",value,fitness,iteration,x,brakeTemperature))


    %if (fitnessList(i) > maximumFitness ) 
    %    maximumFitness  = fitnessList(i);
    %    iBestIndividual = i;
    %end
end

