individual1 = population(1).Chromosome
individual2 = population(2).Chromosome

Cross(individual1, individual2)
function newIndividuals = Cross(individual1, individual2)
length(individual1)
length(individual2)
start1 = randi([0 length(individual1)/4-1])
stop1 = randi([start1+1 length(individual1)/4])

start2 = randi([0 length(individual2)/4-1])
stop2 = randi([start2+1 length(individual2)/4])


cr1 = individual1(start1*4+1:stop1*4)
cr2 = individual1(start2*4+1:stop2*4)

new1 = [individual1(1:start1*4) cr2 individual1(stop1:end)]
new2 = [individual1(1:start2*4) cr1 individual1(stop2:end)]

end




%mod(individual1,4)


%nGenes = size(individual1,2);
%crossoverPoint = 1 + fix(rand*(nGenes-1));

%newIndividuals = zeros(2,nGenes);
%for j = 1:nGenes
%    if j <= crossoverPoint
%        newIndividuals(1,j) = individual1(j);
%        newIndividuals(2,j) = individual2(j);
%    else
%        newIndividuals(1,j) = individual2(j);
%        newIndividuals(2,j) = individual1(j);
%    end
%end

%end