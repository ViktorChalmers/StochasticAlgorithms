function [condition type value] = checkConstraints(velocity,alpha,brakeTemperature,brakePressure,gear,x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
condition = true;
type = "";
value = 0;

run loadConstants.m

if velocity>1
    type = "velocity";
    value = velocity;
    condition = false;
elseif velocity<VELOCITY_MIN/VELOCITY_MAX
    type = "velocity";
    value = velocity;
    condition = false;
elseif alpha>1 || alpha<0
    type = "alpha";
    value = alpha;
    condition = false;
elseif brakeTemperature>1 || brakeTemperature<0
    type = "brakeTemperature";
    value = brakeTemperature;
    condition = false;
elseif brakePressure>1 || brakePressure<0
    type = "brakePressure";
    value = brakePressure;
    condition = false;
elseif gear<1 || gear> 10
    type = "gear";
    "gearbreak"
    value = gear;
    condition = false;
elseif x >  1000 || x<0
    type = "complete";
    value = x;
    condition = false;
end
end

