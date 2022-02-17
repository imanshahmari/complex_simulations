%left = -1
%middle = 0
%right = 1
clc
clear 
steps = 10000; % change this 
T = 1;
kb = 1;
Eb = 2*kb*T;
stopDestinations = round(linspace(1,steps,100));
occurencies = zeros(steps,3);

state = -1;
numberOfMiddle = 0;
numberOfLeft = 1;
numberOfRight = 0;

for j = 1: steps
    if state == -1
        r = rand();
        pMiddle = exp(-Eb/kb*T)/(exp(-Eb/kb*T)+exp(0));
        if r < pMiddle 
            state = 0;
            numberOfMiddle = numberOfMiddle +1;
        else
            state = -1;
            numberOfLeft = numberOfLeft +1; 
        end 
    elseif state ==0
        r = rand();
        pLeft = exp(0) / (2*exp(0) + exp(-Eb/kb*T));
        pRight = exp(0) / (2*exp(0) + exp(-Eb/kb*T));
        pStaying = exp(-Eb/kb*T)/(2*exp(0) + exp(-Eb/kb*T));
        if r < pLeft
            state = -1;
            numberOfLeft = numberOfLeft +1; 
        elseif r < pStaying +pLeft
            state = 0;
            numberOfMiddle = numberOfMiddle +1;
        else
            state = 1;
            numberOfRight = numberOfRight +1; 
        end
        
    elseif state ==1
        r=rand();
        pMiddle = exp(-Eb/kb*T)/(exp(-Eb/kb*T)+exp(0));
        if r < pMiddle 
            state = 0;
            numberOfMiddle = numberOfMiddle +1;
        else
            state = 1;
            numberOfRight = numberOfRight +1; 
        end 
    end
    occurencies(j,:) = [numberOfLeft,numberOfMiddle,numberOfRight]./j;
    states(j) = state;
end
x=linspace(1,1000,1000);
plot(x,states(1:1000))

