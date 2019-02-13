%Sample 4a
t = 0 : .001 : 20;			%small step size used for smooth graph
u0 = [.5 0];
options = odeset('RelTol',1e-7,'AbsTol',1e-7;
[t u] = ode45('sample4af',t,u0,options);
line1x = [0 20];
line1y = [0 0];
plot(t,u(:,1),'b',t,u(:,2),'r',line1x,line1y,'k');
axis([0 20 -5 6]);
set(gca,'xtick',0:2:20);
set(gca,'ytick',-5.6);
xlabel('t');
ylabel('x(blue),v(red)');
title('Sample 4a');
