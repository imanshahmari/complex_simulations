%left = -1
%middle = 0
%right = 1
clc
clear 
steps = 5000; % change this 
T = 1;
tList = linspace(0,5,101);
kb = 1;
Eb = 2*kb*T;
occurencies = zeros(steps,3);

state = -1;
numberOfMiddle = 0;
numberOfLeft = 1;
numberOfRight = 0;
probs=[];
for i =1:length(tList)
    occurencies = zeros(steps,3);
    state = -1;
    numberOfMiddle = 0;
    numberOfLeft = 1;
    numberOfRight = 0;
    
    for j = 1: steps
        if state == -1
            r = rand();
            pMiddle = exp(-Eb/kb*tList(i))/(exp(-Eb/kb*tList(i))+exp(0));
            if r < pMiddle 
                state = 0;
                numberOfMiddle = numberOfMiddle +1;
            else
                state = -1;
                numberOfLeft = numberOfLeft +1; 
            end 
        elseif state ==0
            r = rand();
            pLeft = exp(0) / (2*exp(0) + exp(-Eb/kb*tList(i)));
            pRight = exp(0) / (2*exp(0) + exp(-Eb/kb*tList(i)));
            pStaying = exp(-Eb/kb*tList(i))/(2*exp(0) + exp(-Eb/kb*tList(i)));
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
            pMiddle = exp(-Eb/kb*tList(i))/(exp(-Eb/kb*tList(i))+exp(0));
            if r < pMiddle 
                state = 0;
                numberOfMiddle = numberOfMiddle +1;
            else
                state = 1;
                numberOfRight = numberOfRight +1; 
            end 
        end
        occurencies(j,:) = [numberOfLeft,numberOfMiddle,numberOfRight]./j;
    end
probs = [probs;occurencies(j,:)];
end

        
        

