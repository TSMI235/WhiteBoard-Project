%Sample 4b
t = 0:.001:8;
u0 = [.7 0 .2 0 .4 0];
options = odeset('RelTol',1e-7,'AbsTol',1e-7);
[t u] = ode45('sample4bf',t,u0,options);
line1x = [0 8];
line1y = [0 0];
figure(1);
plot(t,u(:,1),'b',t,u(:,3),'r',t,u(:,5),'g',line1x,line1y,'k');
axis([0 8 -1 1]);
set(gca,'xtick',0:8);
set(gca,'ytick',-1:.2:1);
xlabel('t');
ylabel('x1(blue), x2(red), x3(green)');
title('Sample 4b, Figure 1');
figure(2);
plot(t,u(:,2),'b',t,u(:,4),'r',t,u(:,6),'g',line1x,line1y,'k');
axis([0 8 -3 3]);
set(gca,'xtick',0:8);
set(gca,'ytick',-3:3);
xlabel('t');
ylabel('x1(blue), x2(red), x3(green)');
title('Sample 4b, Figure 2');

% function sample4bf
function f = sample4bf(t,uf)
m1 = .8
m2 = .6
m3 = .5
k1 = 4.3
k2 = 5.1
k3 = 4.6
k4 = 5.4
x1 = uf(1);
v1 = uf(2);
x2 = uf(3);
v2 = uf(4);
x3 = uf(5);
v3 = uf(6);
f = zeros(6,1);
f(1) = v1;
f(2) = 
f(3) = v2;
f(4) = 
f(5) = v3;
f(6) 
