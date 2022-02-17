r = 0.1;
K = 2;
x0 = 0.1;
timeStep1 = 5;
timeStep2 = 0.05;
maxTime1 = 100/timeStep1;
maxTime2 = 100/timeStep2;
currentTime1 = 0;
currentTime2 = 0;
xList1=[x0];
xList2 =[x0];
xList3 =[x0];
timeList1 = [0];
timeList2 = [0];
for i = 1:maxTime1
    xList1(i+1) = xList1(i) + r * xList1(i) * ( 1 - (xList1(i)/K)) *timeStep1;
    timeList1(i+1) = timeList1(i)+timeStep1;
end
for j = 1:maxTime2
    xList2(j+1) = xList2(j) + r * xList2(j) * ( 1 - xList2(j)/K) *timeStep2;
    xList3(j+1) = K * (-(1-r*timeStep2) + sqrt((1-r*timeStep2)^2 + 4 * r* timeStep2 * (xList3(j)/K)))/(2*r*timeStep2);
    timeList2(j+1) = timeList2(j)+timeStep2;
end

analytical = K./(1+((K./x0)-1).*exp(-r.*(timeList2)));

figure(1)
scatter(timeList1,xList1,'k', 'square', 'filled'); hold on;
plot(timeList2,xList2);hold off

figure(2)
plot(timeList2,analytical)

figure(3)
plot(timeList2,xList3)