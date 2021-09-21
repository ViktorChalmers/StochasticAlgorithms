% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.
function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue)
numberOfGenes = length(chromosome);
kDecodedLength = numberOfGenes/numberOfVariables;

numberOfDecodedChromosomes = numberOfGenes/kDecodedLength;

x = zeros(1,numberOfDecodedChromosomes);
step = 0;
for j = 1:numberOfDecodedChromosomes
    for i = 1:kDecodedLength
        x(j) = x(j) + chromosome(i+step)*2^(-i)*2*maximumVariableValue/(1-2^(-kDecodedLength));
    end
    x(j) = x(j)-maximumVariableValue;
    step = step + kDecodedLength;
end

end
% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.
% function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue);
% 
%     m = length(chromosome);
%     n = numberOfVariables;
%     k = m/n;
%     
%     x = zeros(1,numberOfVariables);
%     for j=1:numberOfVariables
%         for i=1:k
%             x(j) = x(j)+(2^(-i)*chromosome(i+(j-1)*k));
%         end
%         
%     end
%     
%      x=x*(2*maximumVariableValue/(1-2^(-k)));
%      x = x - maximumVariableValue;
%      
%     
% end

