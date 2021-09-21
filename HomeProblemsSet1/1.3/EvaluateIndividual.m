% First compute the function value, then compute the fitness
% value; see also the problem formulation.
% function fitness = EvaluateIndividual(x)
% f = @(x1,x2) (1.5-x1+x1*x2)^2+(2.25-x1+x1*x2^2)^2+(2.625-x1+x1*x2^3)^2;
% 
% 
% fitness = 1/f(x(1),x(2));
% end
% % First compute the function value, then compute the fitness
% % value; see also the problem formulation.

function fitness = EvaluateIndividual(x);
    gTerm1 = (1.5-x(1)+x(1)*x(2))^2;
    gTerm2 = (2.25-x(1)+x(1)*x(2)^2)^2;
    gTerm3 = (2.625-x(1)+x(1)*x(2)^3)^2;
    g = gTerm1+gTerm2+gTerm3;
    fitness = 1/(g);
    

