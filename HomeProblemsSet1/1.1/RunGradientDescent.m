% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.
clc,clear
muValues = [1 10 100 1000];
eta = 0.0001;
xStart =  [1 2];
gradientTolerance = 1E-6;

for i = 1:length(muValues)
    mu = muValues(i);
    x = RunGradientDescent(xStart,mu,eta,gradientTolerance);
    sprintf('x(1) = %3f, x(2) = %3f mu = %d',x(1),x(2),mu)
end

function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)

for i = 1:inf
    searchDirection = -ComputeGradient(xStart,mu);
    xNext = xStart + eta*searchDirection;
    xStart = xNext;
    if(gradientTolerance>norm(-searchDirection))
        i
        "asdasd"
        break
    end
    
end
x = xNext;
end

