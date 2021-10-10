
function population = InitializePopulation(populationSize, numberOfGenes)

population = zeros(populationSize, numberOfGenes);
for i = 1:populationSize
    for j = 1:numberOfGenes
        r = rand;
        if (r < 0.5)
            population(i,j)=r;
        else
            population(i,j)=r;
        end
    end
end

end



