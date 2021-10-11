function deltaBrakeTemperature = UpdateBrakeTemperature(deltaBrakeTemperature,brakeTemperature,brakePressure,BRAKE_CONSTNAT,tAmbient,tau,deltaTime)
%
if brakePressure>0.01
deltaBT = deltaBrakeTemperature+BRAKE_CONSTNAT*brakePressure*deltaTime;
    
else 
    deltaBT = deltaBrakeTemperature-deltaBrakeTemperature*deltaTime/tau;
end
deltaBrakeTemperature = deltaBT;
end

