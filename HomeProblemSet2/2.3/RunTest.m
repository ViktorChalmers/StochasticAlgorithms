clc,clear
run BestChromosome.m;

run loadConstants.m;
run loadInitialValues.m;
iSlope = 4
dataSet = 1
alpha = GetSlopeAngle(x, iSlope,dataSet);

time = 0
nIn = 3;
nHidden = 8;
nOut = 2;
wMax = 5;
[wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax);

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
        time = 0
    end
    time = time+deltaTime;
    
    deltaBrakeTemperature = UpdateBrakeTemperature(deltaBrakeTemperature,brakeTemperature,brakePressure,BRAKE_CONSTNAT,tAmbient,tau,deltaTime);
    brakeTemperature = tAmbient + deltaBrakeTemperature;
    x = x + velocity*deltaTime;
    alpha = GetSlopeAngle(x, iSlope,dataSet);
    velocity = CalculateVelocity(velocity,deltaTime,alpha,gear,brakePressure,ENGINE_BRAKE,brakeTemperature,BRAKE_TEMPERATURE_MAX,mass);
    
    [condition type value] = checkConstraints(velocity/VELOCITY_MAX,alpha/ALPHA_MAX,brakeTemperature/BRAKE_TEMPERATURE_MAX,brakePressure,gear,x);
    
    gearArray(iteration) = gear;
    alphaArray(iteration) = alpha;
    lengthArray(iteration) = x;
    brakePressureArray(iteration) = brakePressure;
    brakeTemperatureArray(iteration) = brakeTemperature;
end

subplot(2,3,1)
plot(lengthArray,gearArray)
title("gear")

subplot(2,3,2)
plot(lengthArray,alphaArray)
title("alpha")

subplot(2,3,3)
plot(lengthArray,brakePressureArray)
title("Preassure")

subplot(2,3,4)
plot(lengthArray,brakeTemperatureArray)
title("Temperature")

subplot(2,3,5)
plot(lengthArray,velocityArray)
title("Velocity")

fitness = mean(velocityArray)*x

%disp(sprintf("Slope %0.0f " + type + " = %0.1f, Finesscore = %0.0f, iteration = %d, length = %0.1d, brakeTemperature = %0.0f",iSlope,value,fitness,iteration,x,brakeTemperature/BRAKE_TEMPERATURE_MAX))
%disp(sprintf('slope = %d, type, ' + type + ' = %0.1f, bTemp = %0.1f, fitness = %0.1f, length = %0.1f',iSlope,value,brakeTemperature,fitness(iSlope),x))


