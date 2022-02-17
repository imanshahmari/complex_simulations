%left = -1
%middle = 0
%right = 1
clc
clear 
steps = 100000; % change this 
kbT = 1;
Eb = 2*kbT;
states = randi([-1,1],999,1);
states = [-1;states];
occurencies = zeros(steps,3);


for i =1:steps
    %[occurenciesBefore,elementsBefore] = groupcounts(states);
    for j = 1: length(states)
        if states(j) == -1
            r = rand();
            pMiddle = exp(-Eb/kbT)/(exp(-Eb/kbT)+exp(0));
            if r < pMiddle 
                states(j) = 0;
            else
                states(j) = -1;
            end 
        elseif states(j) ==0
            r = rand();
            pLeft = exp(0) / (2*exp(0) + exp(-Eb/kbT));
            pRight = exp(0) / (2*exp(0) + exp(-Eb/kbT));
            pStaying = exp(-Eb/kbT)/(2*exp(0) + exp(-Eb/kbT));
            if r < pLeft
                states(j) = -1;
            elseif r < pStaying +pLeft
                states(j) = 0;
            else
                states(j) = 1;
            end

        elseif states(j) ==1
            r=rand();
            pMiddle = exp(-Eb/kbT)/(exp(-Eb/kbT)+exp(0));
            if r < pMiddle 
                states(j) = 0;
            else
                states(j) = 1;
            end 
        end
    [occurenciesAfter,elementsAfter] = groupcounts(states);
    occurencies(i,:) = occurenciesAfter;
    end
end
   
        
        

