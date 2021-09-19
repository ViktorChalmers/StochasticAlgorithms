%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Penalty method for minimizing
%
% (x1-1)^2 + 2(x2-2)^2, s.t.
%
% x1^2 + x2^2 - 1 <= 0.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The values below are suggestions - you may experiment with
% other values of eta and other (increasing) sequences of the
% µ parameter (muValues).

muValues = [1 10 100 1000];
eta = 0.0001;
xStart =  [1,2];
gradientTolerance = 1E-6;

for i = 1:length(muValues)
 mu = muValues(i);
 x(i,:) = RunGradientDescent(xStart,mu,eta,gradientTolerance);
 sprintf('x(1) = %3f, x(2) = %3f mu = %d',x(i,1),x(i,2),mu)
end

plot(muValues,x,'Marker','square','MarkerIndices',1:length(muValues))
title("Penalty method, steplength \eta = 0.0001")
xlabel("Magnitude of penalty term \mu")
ylabel("Value of (x_1,x_2)")
legend("x_1","x_2")

table(x(:,1),x(:,2),muValues','VariableNames',["x1" "x2" 'mu'])