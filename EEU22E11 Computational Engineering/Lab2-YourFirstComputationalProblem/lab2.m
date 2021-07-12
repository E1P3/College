% close all
% clear all
% You normally need these two lines, but in Matlab grader they break the reference solution

% Setting parameters
m = 70;    % mass of parachutist [kg]
g = 9.81;  % gravitational constant [m/s]
c = 12.5;  % drag coefficient [Ns/m]

% Create the vector (array, list) of time values 
delta_t = 1.0;
t = 0: delta_t: 20; % set your time vector here with a step of delta_t

% Calculate the analytic velocity at each time stamp
analytic_velocity = (g*m/c) * (1 - exp(-c*t/m)); 

% The results are plotted here
figure(1);
plot(t, analytic_velocity, 'r-*', 'linewidth', 3);
xlabel('Time (secs)', 'fontsize', 20);
ylabel('Velocity (m/s)', 'fontsize', 20);

% Now use Euler's solution to do the same thing numerically
% First set up N (the number of time values at which you wish to calculate the solution)
N = length(t);
% Set a constant for convenience
drag_const = c / m; 
% Now initialise the numerical solution itself
numerical_solution = zeros(1 , N);
% Set up the initial condition in the solution
% At t = 0, the velocity is 0
numerical_solution(1) = 0;

% Now calculate the numerical_solution at each timestamp k
% You can use either a for-loop or a while-loop but a for-loop makes more sense here
% Insert your code here

for n = 1 : (N - 1),
    numerical_solution(n+1) = numerical_solution(n) + (g - c*numerical_solution(n)/m);
end

% Now plot the two solutions on the same plot
figure(2);
h = plot(t, analytic_velocity, 'g+-', t, numerical_solution, 'ro-', 'LineWidth',3);
grid on;
% Now sort out linewidths and label your axes here
%
% And don't forget the legend! Use ">>help legend" in Matlab to see how to use it.
xlabel('Time (secs)', 'fontsize', 20);
ylabel('Velocity (m/s)', 'fontsize', 20);
legend('Analytic','Numerical');

% Calculate the abs difference at t = 1, 9 secs
% Insert your calculation here
modelling_error = [abs(numerical_solution(2) - analytic_velocity(2)) abs(numerical_solution(10) - analytic_velocity(10))]; 
fprintf(' The error at t = 1 sec is %f, at t = 9 secs it is %f\n', modelling_error(1), modelling_error(2));
