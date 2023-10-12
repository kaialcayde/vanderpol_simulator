% forcedVanDerPolOscillator

% clean all up
clc; clear all; close all;

% initial cond
tspan = [0 600]; % arbitrary
x0 = [0 0]; % arbitrary
eps = 1;    % arbitrary for now



% @changedODEfn defines our forcedVanDerPol equation, and ode45 solves it
% to obtain time and x variables
[t,x] = ode45(@(t,x) changedODEfn(t,x,eps), tspan, x0);

% x is currently two column vectors, so need to get all rows of each 
% The first column of y corresponds to x1, and the second column to x2.
% x1 is x and x2 is dx/dt.
figure(1);
plot(x(:,1),x(:,2));
xlabel('x');
ylabel('dx/dt');
title('Forced Van der Pol Equation, graph of dx/dt vs time');


