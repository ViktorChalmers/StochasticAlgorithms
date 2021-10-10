function gear = UpdateGear(gear,gearChange)

    gear = gear + gearChange;
if gear > 10
    gear = 10;
elseif gear<1
    gear = 1;
end
end

