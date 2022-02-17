function [nextX] = NextX(x,y,timeStep,alfa,beta,delta,gamma)
%NEXTX Summary of this function goes here
%   Detailed explanation goes here
b = ((1-alfa*timeStep)*(1+gamma*timeStep)+delta*timeStep*x+beta*timeStep*y)/((1-alfa*timeStep)*delta*timeStep);
c = (1+gamma*timeStep)*x/((1-alfa*timeStep)*delta*timeStep);

nextX = -sqrt((b^2)/4 -c) + b/2;

end

