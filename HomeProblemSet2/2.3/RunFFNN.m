function [gearChange brakePressure] = RunFFNN(input,wIH,wHO)
%


localFieldIH = mtimes(wIH(1:end,1:end-1),input)-wIH(:,end);
neuron = sigmoid(localFieldIH);

localFieldHO = mtimes(wHO(1:end,1:end-1),neuron) - wHO(:,end);

gearChange = sigmoid(localFieldHO(1));
brakePressure = sigmoid(localFieldHO(2));
%if brakePressure>1
%    brakePressure = 1;
%end

end

