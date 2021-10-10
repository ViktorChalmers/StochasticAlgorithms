function bTemp = UpdateBrakeTemperature(brakeTemperature,breakPreassure,BRAKE_CONSTNAT,tAmbient)
%

deltaBT = BRAKE_CONSTNAT*breakPreassure;
    bTemp = brakeTemperature + deltaBT;
end

