%% Input Data 
alfa =2/3;
beta = 4/3;
gamma = 1;
delta = 1;
%% Calculations 
xeq = gamma/delta;
yeq = alfa/beta;
u0 = 1.62- xeq;
v0 = 0.47- yeq;


time = linspace(0,20,2001);
omega = sqrt(alfa*gamma);
A = sqrt(u0^2 + ((beta*gamma*v0)/(delta*omega))^2);
phi1 = acos(u0/A);
%phi2 = asin(gamma*beta*v0/(A*omega*delta));

xT = A.*cos(omega.*time + phi1) + gamma/delta;
yT = ((delta .* A .* omega .* sin(omega.*time + phi1))./(beta.*gamma))+alfa/beta ;

figure(1)
plot(time,xT);
hold on 
plot(time,yT);hold off

figure(2)
plot(xT,yT)
axis([0 2 0 2])

figure(3)
xaxis = linspace(0,2);
yaxis = linspace(0,2);
[X,Y] = meshgrid(xaxis,yaxis);
Z = delta .* X-gamma .* log(X) + beta .* Y - alfa .* log(Y);
contour(X,Y,Z,100)
%% Euler explicit
xList=[1];
yList=[1];
timeList = [0];
iList = [delta * xList(1)-gamma* log(xList(1)) + beta * yList(1) - alfa * log(yList(1))];
timeStep = 0.01;
maxTime = 20/timeStep;
currentTime = 0;
for i=1:maxTime
    xList(i+1) = xList(i)*(1+(alfa-beta*yList(i))*timeStep);
    yList(i+1) = yList(i)*(1+(delta*xList(i)-gamma)*timeStep);
    iList(i+1) = delta*xList(i+1)-gamma*log(xList(i+1))+beta*yList(i+1)-alfa*log(yList(i+1));
    timeList(i+1) = timeList(i)+timeStep;
end
figure(4)
plot(timeList,xList);
hold on 
plot(timeList,yList);


constantIVector = ones(1,length(iList))*iList(1);
figure(5)
plot(timeList,constantIVector)
hold on
plot(timeList,iList)
hold off

figure(6)
scatter(xList(1),yList(1),'k', 'square', 'filled');hold on
plot(xList(1:length(xList)-1),yList(1:length(xList)-1));hold on
scatter(xList(length(xList)),yList(length(yList)),'k','filled'); hold off

