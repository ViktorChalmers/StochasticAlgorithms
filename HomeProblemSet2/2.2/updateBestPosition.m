function [particleBest swarmBest] = updateBestPosition(positions,f,particleBest,swarmBest)
%[particleBest swarmBest] = updateBestPosition(positions,f,swarmBest,particleBest,swarmBest)

N = length(positions(:,1));
x1 = positions(:,1);
x2 = positions(:,2);

xpb = particleBest;
xsb = swarmBest;

for i = 1:N

    if f(x1(i),x2(i))<f(xpb(i,1),xpb(i,2)) | isnan(xpb)
        particleBest(i,:) = [x1(i) x2(i)];
    end
    if f(x1(i),x2(i))<f(xsb(1),xsb(2)) | isnan(xsb)
        swarmBest =  [x1(i) x2(i)];
    end
end

end