clc
clear 
N = 200;
Q = 1000; %change this according to question 
J = 1;
kb = 1;
H = linspace(0,0.05,100);
T = 0.3;
beta = 1 /(kb*T);


states =(randi([0,1],N,N) +1)*2 -3;
zerosRow= zeros(1,N+2);
zerosCol = zeros(N,1);
states = [zerosCol,states,zerosCol];
states = [zerosRow;states;zerosRow];
for j = 1:length(H)
    for q= 1:Q
        %{
        if idx(1) == 1 && idx(2) ==1
            M = states(N,idx(2)) + states(idx(1)+1,idx(2)) +states(idx(1),N)+states(idx(1),idx(2)+1);
        elseif idx(1) == 1 && idx(2) ==N
            M = states(N,idx(2)) + states(idx(1)+1,idx(2)) +states(idx(1),idx(2)-1)+states(idx(1),1);
        elseif idx(1) == N && idx(2) ==1
            M = states(idx(1)-1,idx(2)) + states(1,idx(2)) +states(idx(1),N)+states(idx(1),idx(2)+1);
        elseif idx(1) == N && idx(2) ==N
            M = states(idx(1)-1,idx(2)) + states(1,idx(2)) +states(idx(1),idx(2)-1)+states(idx(1),1);
        elseif idx(1)==1


        else
            M = states(idx(1)-1,idx(2)) + states(idx(1)+1,idx(2)) +states(idx(1),idx(2)-1)+states(idx(1),idx(2)+1);
        end
        %}
        for i=1:N*N/10
            idx = randi([2,201],1,2);
            M = states(idx(1)-1,idx(2)) + states(idx(1)+1,idx(2)) +states(idx(1),idx(2)-1)+states(idx(1),idx(2)+1);
            ePlus = -(H(j) +J*M);
            eMinus = H(j) +J*M;
            probPlus = exp(-beta*ePlus)/(exp(-beta*ePlus)+exp(-beta*eMinus));
            probMinus = exp(-beta*eMinus)/(exp(-beta*ePlus)+exp(-beta*eMinus));
            if probMinus < probPlus
                r=rand();
                if r < probMinus
                    states(idx(1),idx(2)) = -1;
                else
                    states(idx(1),idx(2)) = 1;
                end
            elseif probPlus <= probMinus
                r=rand();
                if r < probPlus
                    states(idx(1),idx(2)) = 1;
                else
                    states(idx(1),idx(2)) = -1;
                end
            end
        end
    end
    magnitiziation(j) = sum(sum(states))/(N^2);
end
%% section 
plot(H,magnitiziation)
xlabel('H') 
ylabel('Magnitization') 

