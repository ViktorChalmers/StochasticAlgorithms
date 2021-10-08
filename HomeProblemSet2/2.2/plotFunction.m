function [Z] = plotFunction(f,positionRange,type,type2,alpha)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if (nargin==3)
   type2 = "standard";
elseif (nargin==4)
   alpha = 1;
end


    x = linspace(positionRange(1),positionRange(2));
    y = linspace(positionRange(1),positionRange(2));
    [X,Y] = meshgrid(x,y);
    a = 1;
    for xi = 1:length(x)
        for yi = 1:length(y)
            Z(yi,xi) = f(x(xi),y(yi));
        end
    end
    
    if type2 == "log"
        Z = log(alpha+Z);
    end
    if type == "surf"
    s = surf(X,Y,Z,'FaceAlpha',0.1);
    s.EdgeColor = 'none';
    title("surface plot of PSO of function f(x,y)")
    elseif type == "contour"
        contour(X,Y,Z)
        title("contour plot of PSO of function f(x,y)")
    end
    colorbar()
    zlabel("f(x,y)")
    xlabel("x-axis")
    ylabel("y-axis")
end

