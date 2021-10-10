% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.

function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)

while(true)
    searchDirection = -ComputeGradient(xStart,mu);
    xNext = xStart + eta*searchDirection;
    xStart = xNext;
    if(gradientTolerance>norm(-searchDirection))
        break
    end
    
end
x = xNext;
end

