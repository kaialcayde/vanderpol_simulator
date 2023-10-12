% Bifurcation diagram

% clean all up
clc;clear all; close all;

% initial cond, arbitrary
tspan = [0 600];
x0 = [0 0];

% bounds of epsilon for each graph
lowerBound = 1;
upperBound = 5;
% get ready to graph
figure(1);
hold on;
% make a ton of points for the bifurification diagram to essentially
% span the range of the lower to upper bound of epsilon
eps = linspace(lowerBound,upperBound,400);

for epsCounter = 1:length(eps)
    
    % evaluate the ode at the given epsilon
    [t,x] = ode45(@(t,x) changedODEfn(t,x,eps(epsCounter)), tspan, x0);



    % plot epsilon vs x for all of time.
    oldTime = t(1);
    for timeCounter = 1:length(t)

        % count every 5 seconds bc it would be redundant (too long)
        if( t(timeCounter)>= oldTime )
            oldTime = oldTime +   40;

            % the period helps make the graph into a scatter graph 
            % bc can be multiple x values for one eps value
            plot(eps(epsCounter), x(timeCounter,1), 'b.');

        end
    end


end

title('Bifurcation Diagram');
xlabel('\epsilon \in [1,5]' );
ylabel('x');
