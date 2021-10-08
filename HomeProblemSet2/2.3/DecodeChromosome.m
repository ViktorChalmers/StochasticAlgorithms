function [wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax);

wIH = zeros(nHidden+1,nIn)
wHO = zeros(nOut,nHidden+1)

for i = 1:length(chromosome)
    if (chromosome(i) > abs(wMax))
        chromosome(i) = sign(chromosome(i))*wMax;
    end
end

for i = 1:nHidden+1
    wIH(i,:) = chromosome(1:nIn);
    chromosome(1:nIn) = [];
end
chromosome;
for i = 1:nOut
    wHO(i,:) = chromosome(1:nHidden+1);
    chromosome(1:nHidden+1) = [];
end

end