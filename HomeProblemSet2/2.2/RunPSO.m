x = linspace(-5,5);
y = linspace(-5,5);
[X,Y] = meshgrid(x,y);
a = 1
Z = (X.^2+Y-11).^2 + (X+Y.^2-7).^2;
subplot(2,2,1)
contour(X,Y,Z);

subplot(2,2,2)
surf(X,Y,Z);

Z = log(a+Z);
subplot(2,2,3)
contour(X,Y,Z);

subplot(2,2,4)
surf(X,Y,Z);

%%
f =@(x1,x2) (x^2+y-11)^2+(x+y^2-7)^2
size(f)
%% Constants
cognetiveConstant = 2
socialConstant = 2
numberOfParticles = 20
dimensions = 2
