function [wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax);

wIH = zeros(nHidden,nIn+1);
wHO = zeros(nOut,nHidden+1);

for i = 1:length(chromosome)
    if (chromosome(i) > abs(wMax))
        chromosome(i) = sign(chromosome(i))*wMax;
    end
end

for i = 1:nIn
    wIH(i,:) = chromosome(1:4);
    chromosome(1:nHidden+1) = [];
end

for i = 1:nOut
    wHO(i,:) = chromosome(1:4);
    chromosome(1:nHidden+1) = [];
end

end