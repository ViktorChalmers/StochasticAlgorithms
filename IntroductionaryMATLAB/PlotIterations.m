% This method should plot the polynomial and the iterates obtained
% using NewtonRaphsonStep (if any iterates were generated).

function PlotIterations(polynomialCoefficients, iterationValues)
hold on
y = [];
for i = 1:length(iterationValues)
y(i) = GetPolynomialValue(iterationValues(i),polynomialCoefficients);
end

iterationValues(end);
y(end);
plot(iterationValues,y,"o")
%x = RunNewtonRaphson(polynomialCoefficients,1,0.5)
%GetPolynomialValue(x, polynomialCoefficients)

xStartPlot = round(min(iterationValues))-1;
xEndPlot = round(max(iterationValues))+1;
x = linspace(xStartPlot,xEndPlot);
y = [];
for i = 1:length(x)
    y(i) = GetPolynomialValue(x(i),polynomialCoefficients);
end
plot(x,y)
hold off
end



