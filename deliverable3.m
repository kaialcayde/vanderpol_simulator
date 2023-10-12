% forcedVanDerPolOscillator
clc;clear all; close all;

F = 0.2239; % force
w = (2*pi/10);
eps = 1;    % arbitrary for now

syms x(t)
% [V] = odeToVectorField(diff(x, 2) == ...
%     ((eps/w)*(1-x^2)*diff(x))-x+(eps*F*cos(w*t)));

[V] = odeToVectorField(diff(x, 2) == ...
    ((4.75/(2*pi/10))*(1-x^2)*diff(x))-x+(4.75*0.2239*cos((2*pi/10)*t)));

M = matlabFunction(V,'vars', {'t','Y'});

tspan = [0 20];
y0 = [0 0];
[t,y] = ode45(M, tspan, y0);

z = linspace(-2.5,2.5,613)
plot(z,y);