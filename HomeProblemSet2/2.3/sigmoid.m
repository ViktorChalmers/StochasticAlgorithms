function neuron = sigmoid(localFieldIH)
%
p = @(x) 1/(1+exp(-2*x));
neuron = zeros(size(localFieldIH));
for i = 1:length(localFieldIH)
    r = rand;
    if r<p(localFieldIH(i))
        neuron(i) = +1;
    else
        neuron(i) = -1;
    end
end
end