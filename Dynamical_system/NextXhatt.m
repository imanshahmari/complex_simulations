function [nextXhatt] = NextXhatt(x,y,timeStep,alfa,beta,delta,gamma,type)
%NEXTXHATT Summary of this function goes here
%   Detailed explanation goes here
if type ==1 
    xImplicit = x*(1+timeStep*(alfa-((beta*y)/(1-timeStep*(delta*(x-gamma))))));
    nextXhatt = xImplicit;
elseif type ==0
    xExplicit = x/(1-timeStep*(alfa-beta*y)) ;
    nextXhatt = xExplicit;
end


