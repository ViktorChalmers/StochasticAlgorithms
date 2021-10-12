clc,clear
run BestChromosome.m

run loadConstants.m
run loadInitialValues.m
alpha = GetSlopeAngle(x, 1, 1);

nIn = 3;
nHidden = 8;
nOut = 2;
wMax = 5;
[wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax);
RunFFNN([0.5 0.5 0.5],wIH,wHO)
%%
iteration = 0;
condition  = true;
velocityArray = 0;
while(condition)
    iteration = iteration+1;
    
    velocityArray(iteration) = velocity;
    
    input = [velocity/VELOCITY_MAX alpha/ALPHA_MAX brakeTemperature/BRAKE_TEMPERATURE_MAX]';
    
    [gearChange brakePressure] = RunFFNN(input,wIH,wHO);
    
    gear = UpdateGear(gear,gearChange);
    
    deltaBrakeTemperature = UpdateBrakeTemperature(deltaBrakeTemperature,brakeTemperature,brakePressure,BRAKE_CONSTNAT,tAmbient,tau,deltaTime);
    brakeTemperature = tAmbient + deltaBrakeTemperature;
    x = x + velocity*deltaTime;
    alpha = GetSlopeAngle(x, 1, 3);
    velocity = CalculateVelocity(velocity,deltaTime,alpha,gear,brakePressure,ENGINE_BRAKE,brakeTemperature,BRAKE_TEMPERATURE_MAX,mass);
    
    [condition type value] = checkConstraints(velocity/VELOCITY_MAX,alpha/ALPHA_MAX,brakeTemperature/BRAKE_TEMPERATURE_MAX,brakePressure,gear,x);
    x;
    velocity;
    
    
    gearArray(iteration) = gear;
    alphaArray(iteration) = alpha;
    lengthArray(iteration) = x;
    brakePressureArray(iteration) = brakePressure;
    brakeTemperature(iteration) = brakeTemperature;
    
    
end
fitness = mean(velocityArray)*x;

%disp(sprintf("Slope %0.0f " + type + " = %0.1f, Finesscore = %0.0f, iteration = %d, length = %0.1d, brakeTemperature = %0.0f",iSlope,value,fitness,iteration,x,brakeTemperature/BRAKE_TEMPERATURE_MAX))
%disp(sprintf('slope = %d, type, ' + type + ' = %0.1f, bTemp = %0.1f, fitness = %0.1f, length = %0.1f',iSlope,value,brakeTemperature,fitness(iSlope),x))


