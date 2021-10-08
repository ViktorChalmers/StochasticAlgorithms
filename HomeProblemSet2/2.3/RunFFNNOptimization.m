clc,clear
nIn = 3;
nHidden = 3;
nOut = 2;
wMax = 4;
chromosome = randi(2,[1 20]);
chromosome(chromosome==2) = 0;


input = [0.5 0.3 0.7]'


[wIH wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax)

localFieldIH = mtimes(wIH,input)
neuron = sigmoid(localFieldIH)

localFieldHO = mtimes(wHO,neuron)
output = sigmoid(localFieldHO)

