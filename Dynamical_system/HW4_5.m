%% Combo 
alfa =2/3;
beta = 4/3;
gamma = 1;
delta = 1;

xList=[1];
yList=[1];
timeList = [0];
iList = [delta * xList(1)-gamma* log(xList(1)) + beta * yList(1) - alfa * log(yList(1))];
timeStep = 0.01;
maxTime = 20/timeStep;
currentTime = 0;
for i=1:maxTime
    xNext = NextXhatt(xList(i),yList(i),timeStep,alfa,beta,delta,gamma,0);
    yNext = NextYhatt(xList(i),yList(i),timeStep,alfa,beta,delta,gamma,1);    
    xList(i+1) = xNext;
    yList(i+1) = yNext;
    iList(i+1) = delta*xList(i+1)-gamma*log(xList(i+1))+beta*yList(i+1)-alfa*log(yList(i+1));
    timeList(i+1) = timeList(i)+timeStep;
end
figure(2)
plot(timeList,xList);
hold on 
plot(timeList,yList);


constantIVector = ones(1,length(iList))*iList(1);
figure(3)
plot(timeList,constantIVector)
hold on
plot(timeList,iList)
hold off

figure(4)
scatter(xList(1),yList(1),'k', 'square', 'filled');hold on
plot(xList(1:length(xList)-1),yList(1:length(xList)-1));hold on
scatter(xList(length(xList)),yList(length(yList)),'k','filled'); hold off



