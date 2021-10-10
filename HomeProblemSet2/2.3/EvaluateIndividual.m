function [fitness x] = EvaluateIndividual(wIH, wHO,iSlope,iDataSet);


velocityMax = 25;
alphaMax = 10;
BRAKE_TEMPERATURE_MAX = 750;
ENGINE_BRAKE = 3000;
BRAKE_CONSTNAT = 40;
tAmbient = 283;
deltaTime = 0.25;
mass = 20000;

brakePressure = 0;
velocity = 20;
x = 0;
gear = 7;
brakeTemperature = 500;
gearChange=0;
alpha = GetSlopeAngle(x, iSlope, iDataSet);



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
    
    [condition type value] = checkConstraints(velocity/velocityMax,alpha/alphaMax,brakeTemperature/BRAKE_TEMPERATURE_MAX,brakePressure,gear,x);
end
    fitness = mean(savedVel)*x;
    %disp(sprintf("" + type + " = %0.1f, Finesscore = %0.0f, iteration = %d, length = %0.1f, brakeTemperature = %0.0f",value,fitness,iteration,x,brakeTemperature))
    if type == "complete"
        "Complete"
    end
end
