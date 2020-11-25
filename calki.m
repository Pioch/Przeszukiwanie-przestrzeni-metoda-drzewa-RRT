function wy = calki(we)

global step

% tspan = 0:step:5;
% T=1;
% theta = pi/5;
T = we(1);
theta = we(2);
czas = we(3);
tspan = 0:step:czas;
p0 = [we(4); we(5)];
psi0 = we(6);
u0 = we(7);
v0 = we(8);
r0 = we(9);
y0 = [p0; psi0; u0; v0; r0]; 

% tspan = 0:0.01:100;
% T=10;
% theta = pi/5;
% y0 = [0; 0; 0; 0; 0; 0];
[t, y] = ode45(@(t,y) dynamika([T; theta; t; y]), tspan, y0);

wy = y;

end
