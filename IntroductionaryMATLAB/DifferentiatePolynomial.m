% This method should return the coefficients of the k-th derivative (defined by
% the derivativeOrder) of the polynomial given by the polynomialCoefficients (see also GetPolynomialValue)

function derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder)

nOrderPolynomial = length(polynomialCoefficients)-1;
returnArraySize = nOrderPolynomial+1-derivativeOrder;

if (returnArraySize <= 0)
    returnArray = 0;
else
    
    returnArray = polynomialCoefficients;
    for j=1:derivativeOrder
        for i=1:length(returnArray)
            returnArray(i) = returnArray(i)*(i-1);
        end
            returnArray(1) = [];
    end
    
end

derivativeCoefficients = returnArray;
end