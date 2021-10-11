function gear = UpdateGear(gear,gearChange)

if gearChange <0.33
    gearChange = -1;
elseif gearChange > 0.67
    gearChange = 1;
else
    gearChange = 0;
end

gear = gear + gearChange;
if gear > 10
    gear = 10;
elseif gear<1
    gear = 1;
end
end

