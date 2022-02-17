function [nextY] = NextY(x,y,timeStep,alfa,beta,delta,gamma)
%NEXTX Summary of this function goes here
%   Detailed explanation goes here
b = ((1-alfa*timeStep)*(1+gamma*timeStep)-beta*timeStep*y-delta*timeStep*x)/((1-gamma*timeStep)*beta*timeStep);
c = (1-alfa*timeStep)*y/((1-gamma*timeStep)*beta*timeStep);

nextY = sqrt((b^2)/4 +c) - b/2;

end

