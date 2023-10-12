function dxdt = changedODEfn(t,x,eps)
% this function defines the forced van Der pol equation and  makes it so 
% that x(1) is the original value x and x(2) is the
% derivative dx/dt. The idea was taken from the matlab page.

F = 0.2239; % force
w = (2*pi)/10;  % omega


dxdt = zeros(2,1); % make a 2 column vector for the system of first order ODE that we made

% make forced vanderpol equation into system of first-order ODE's
dxdt(1) = x(2);
dxdt(2) = (eps/w)*(1-x(1)^2)*dxdt(1)-x(1)+(eps*F*cos(w*t));


end