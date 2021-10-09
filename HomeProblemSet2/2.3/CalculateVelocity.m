
function v = CalculateVelocity(vel,dT,alpha,gear,bP,ENGINE_BRAKE,bT,bTMax,m)
g = 9.82;
Fg = m*g*sind(alpha);
if bT < bTMax-100
    Fb = m*g/(20)*bP;
else
    Fb = m*g/20*bP*exp(-(bT-(bTMax-100))/100);
end    
Feb = [7 5  4 3 2.5 2 1.6 1.4 1.2 1]*ENGINE_BRAKE;

a = (Fg-Fb-Feb(gear))/m;

v = vel+a*dT;


end