function chromosome = EncodeNetwork(wIH, wHO, wMax)

chromosome = [];

[nIn ~] = size(wIH);
[nOut ~]  = size(wHO);


for i = 1:nIn
    chromosome = [chromosome wIH(i,:)];
end

for i = 1:nOut
    chromosome = [chromosome wHO(i,:)];
end

for i = 1:length(chromosome)
    if (chromosome(i) > abs(wMax))
        chromosome(i) = sign(chromosome(i))*wMax;
    end
end


end