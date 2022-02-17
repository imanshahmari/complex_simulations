alfa =2/3;
beta = 4/3;
gamma = 1;
delta = 1;


xList1=[1];
yList1=[1];
iList1 = [delta * xList1(1)-gamma* log(xList1(1)) + beta * yList1(1) - alfa * log(yList1(1))];



xList2=[1];
yList2=[1];
iList2 = [delta * xList2(1)-gamma* log(xList2(1)) + beta * yList2(1) - alfa * log(yList2(1))];



timeList = [0];
timeStep = 0.01;
maxTime = 20/timeStep;
currentTime = 0;
for i=1:maxTime
    
    xNext1 = NextXhatt(xList1(i),yList1(i),timeStep,alfa,beta,delta,gamma,0);
    yNext1 = NextYhatt(xList1(i),yList1(i),timeStep,alfa,beta,delta,gamma,1);    
    xList1(i+1) = xNext1;
    yList1(i+1) = yNext1;
    iList1(i+1) = delta*xList1(i+1)-gamma*log(xList1(i+1))+beta*yList1(i+1)-alfa*log(yList1(i+1));    
    

    xNext2 = NextXhatt(xList2(i),yList2(i),timeStep,alfa,beta,delta,gamma,1);
    yNext2 = NextYhatt(xList2(i),yList2(i),timeStep,alfa,beta,delta,gamma,0);    
    xList2(i+1) = xNext2;
    yList2(i+1) = yNext2;
    iList2(i+1) = delta*xList2(i+1)-gamma*log(xList2(i+1))+beta*yList2(i+1)-alfa*log(yList2(i+1));    

    
    
    
    timeList(i+1) = timeList(i)+timeStep;
end
xeq = gamma/delta;
yeq = alfa/beta;
u0 = 1- xeq;
v0 = 1- yeq;

time = linspace(0,20,2001);
omega = sqrt(alfa*gamma);
A = sqrt(u0^2 + ((beta*gamma*v0)/(delta*omega))^2);
phi1 = acos(u0/A);
phi2 = asin(gamma*beta*v0/(A*omega*delta));

xT = A.*cos(omega.*time + phi1) + gamma/delta;
yT = (delta .* A .* omega .* sin(omega.*time + phi2))./(beta.*gamma)+alfa/beta ;


figure(1)
plot(timeList, xT,"b");hold on
plot(timeList, xList1,"r");hold on
plot(timeList, xList2,"k");hold off

figure(2)
plot(timeList,yT,"b");hold on
plot(timeList,yList1,'r:');hold on
plot(timeList,yList2,"k");hold off

figure(3)
xaxis = linspace(0,2);
yaxis = linspace(0,2);
[X,Y] = meshgrid(xaxis,yaxis);
Z = delta .* X-gamma .* log(X) + beta .* Y - alfa .* log(Y);
contour(X,Y,Z,50) ;hold on

plot(xT,yT,"g");hold on
plot(xList1,yList1,'r:');hold on
plot(xList2,yList2,"k");hold off






