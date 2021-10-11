x = 1:1000;
hold on
for i = 1:10
    subplot(2,5,i)
alpha = GetSlopeAngle(x,i,1);
plot(x,alpha)
title(i)
end
