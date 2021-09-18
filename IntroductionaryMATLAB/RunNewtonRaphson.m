% This function should run the Newton-Raphson method, making use of the
% other relevant functions (StepNewtonRaphson, DifferentiatePolynomial, and
% GetPolynomialValue). Before returning iterationValues any non-plottable values 
% (e.g. NaN) that can occur if the method fails (e.g. if the input is a
% first-order polynomial) should be removed, so that only values that
% CAN be plotted are returned. Thus, in some cases (again, the case of
% a first-order polynomial is an example) there may be no points to plot.


function iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance)

    xjIteration = startingPoint;
    returnIterations = [xjIteration];
    checkTolerance = true;
    
    while(checkTolerance)

        differentedPolynomial = DifferentiatePolynomial(polynomialCoefficients, 1);
        doubleDifferentedPolynomial = DifferentiatePolynomial(polynomialCoefficients, 2);

        fPrime = GetPolynomialValue(xjIteration,differentedPolynomial);
        fDoublePrime = GetPolynomialValue(xjIteration,doubleDifferentedPolynomial);

        if(isnan(StepNewtonRaphson(xjIteration, fPrime, fDoublePrime)))
            break
        end

        xjNextIteration = StepNewtonRaphson(xjIteration, fPrime, fDoublePrime);
 
        checkTolerance = abs(xjNextIteration-returnIterations(end))>tolerance;
     
        returnIterations(end+1) = xjNextIteration;
        xjIteration = xjNextIteration;
    end
    iterationValues = returnIterations;
end
