function [condition type value] = checkConstraints(velocity,alpha,brakeTemperature,brakePressure,gear,x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
condition = true;
type = "";
value = 0;

if abs(velocity)>1
    type = "velocity";
    value = velocity;
    condition = false;
elseif abs(alpha)>1
    type = "alpha";
    value = alpha;
    condition = false;
elseif abs(brakeTemperature)>1
    type = "brakeTemperature";
    value = brakeTemperature;
    condition = false;
elseif abs(brakePressure)>1
    type = "brakePressure";
    value = brakePressure;
    condition = false;
elseif gear<1 || gear> 10
    type = "gear";
    "gearbreak"
    value = gear;
    condition = false;
elseif x>  1000
    type = "complete";
    value = x;
    condition = false;
end
end

