function [nextYhatt] = NextYhatt(x,y,timeStep,alfa,beta,delta,gamma,type)
%NEXTYHATT Summary of this function goes here
%   Detailed explanation goes here
if type == 0
    nextYhatt = y/(1-timeStep*(delta*x-gamma));
elseif type ==1
    nextYhatt = y*(1+timeStep*(delta*x/(1-timeStep*(alfa-beta*y))-gamma));
end
end


