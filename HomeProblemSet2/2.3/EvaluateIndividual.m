function [fitness length] = EvaluateIndividual(wIH, wHO,nSlopes,iDataSet);

run loadConstants.m
time = 0;

for iSlope = 1:nSlopes
    run loadInitialValues.m
    alpha = GetSlopeAngle(x, iSlope, iDataSet);
    
    iteration = 0;
    condition  = true;
    velocityArray = 0;
    while(condition)
        iteration = iteration+1;
        
        velocityArray(iteration) = velocity;
        
        input = [velocity/VELOCITY_MAX alpha/ALPHA_MAX brakeTemperature/BRAKE_TEMPERATURE_MAX]';
        [gearChange brakePressure] = RunFFNN(input,wIH,wHO);
        
        if time > 2
        gear = UpdateGear(gear,gearChange);
        time = 0;
        end
        time = time+deltaTime;
        
        deltaBrakeTemperature = UpdateBrakeTemperature(deltaBrakeTemperature,brakeTemperature,brakePressure,BRAKE_CONSTNAT,tAmbient,tau,deltaTime);
        brakeTemperature = tAmbient + deltaBrakeTemperature;
        x = x + velocity*deltaTime;
        alpha = GetSlopeAngle(x, iSlope, iDataSet);
        velocity = CalculateVelocity(velocity,deltaTime,alpha,gear,brakePressure,ENGINE_BRAKE,brakeTemperature,BRAKE_TEMPERATURE_MAX,mass);
        
        [condition type value] = checkConstraints(velocity/VELOCITY_MAX,alpha/ALPHA_MAX,brakeTemperature/BRAKE_TEMPERATURE_MAX,brakePressure,gear,x);
        x;
        velocity;
    end
    fitness(iSlope) = mean(velocityArray)*x;
    lengthList(iSlope) = x;
    %disp(sprintf("Slope %0.0f " + type + " = %0.1f, Finesscore = %0.0f, iteration = %d, length = %0.1d, brakeTemperature = %0.0f",iSlope,value,fitness,iteration,x,brakeTemperature/BRAKE_TEMPERATURE_MAX))
   %disp(sprintf('slope = %d, type, ' + type + ' = %0.1f, bTemp = %0.1f, fitness = %0.1f, length = %0.1f',iSlope,value,brakeTemperature,fitness(iSlope),x))
    
    x;
end
fitness = mean(fitness);
length = mean(lengthList);
end
