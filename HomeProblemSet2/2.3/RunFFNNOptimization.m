clc,clear
nIn = 3;
nHidden = 3;
nOut = 2;
wMax = 4;
chromosome = rand([1 20]);
chromosome(chromosome==2) = 0;
iSlope = 1
iDataSet = 1

brakePressure = 0
velocity = 0
x = 0
deltaTime = 0.25
acceleration = 0
gear = 1
tAmbient = 283;
mass = 20000
brakeTemperature = tAmbient
BRAKE_TEMPERATURE_MAX = 750
ENGINE_BRAKE = 1
BRAKE_CONSTNAT = 1.4
gearChange=0
[wIH wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax)
velocityMax = 25
alphaMax = 45
tau = 30

x = x + velocity*deltaTime;
alpha = GetSlopeAngle(x, iSlope, iDataSet);
velocity = CalculateVelocity(velocity,deltaTime,alpha,gear,brakePressure,ENGINE_BRAKE,brakeTemperature,BRAKE_TEMPERATURE_MAX,mass);

deltaBrakeTemperature = BRAKE_CONSTNAT*brakePressure;
brakeTemperature = tAmbient + deltaBrakeTemperature;

input = [velocity/velocityMax alpha/alphaMax brakeTemperature/BRAKE_TEMPERATURE_MAX]'

localFieldIH = mtimes(wIH,input);
neuron = sigmoid(localFieldIH);

localFieldHO = mtimes(wHO,neuron)
%output = sigmoid(localFieldHO)
[gearChange brakePressure]



