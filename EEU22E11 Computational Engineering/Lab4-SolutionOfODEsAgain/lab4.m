% Population density calculation
close all
attempts_allowed = 10;
% Define the ground truth from the table given
truth = [[1950 1960 1970 1980 1990 2000];
         [2555 3040 3708 4454 5276 6079]];
% Define step size
h = 1;     % This is not right .. you have to edit this
% Define time interval
t = 1950 : 1 : 2016;  % This is not right .. you have to edit this

% Work out number of time steps
N = length(t);

% Set up output variables for euler and heun estimates
p_euler = zeros(1, N);
p_heun = zeros(1, N);
% Initialise p_euler and p_heun here!!
p_euler(1) = truth(2,1);
p_heun(1) = truth(2,1);

% For testing
pe1 = p_euler(1);
ph1 = p_heun(1);
% Test the differential
o = dpdt(1900);

% Implement the Euler solution here!
for n = 1 : N - 1
    
    p_euler(n + 1) = p_euler(n) + dpdt(p_euler(n)); 
    
end
% Implement the Heun solution here!
for n = 1 : N - 1
    
    k1 = dpdt(p_heun(n));
    k2 = dpdt(p_heun(n) + k1);
    p_heun(n+1) = p_heun(n) + (k1+k2)/2;
    
end
% Calculate the errors here!
e_euler = truth(2, : ) - p_euler(1 : 10 : 51); % This is not right .. you have to edit this
e_heun = truth(2, : ) - p_heun(1 : 10 : 51); % This is not right .. you have to edit this

% Calculate the sum squared errors and hence the value of A
sum_e = sum(e_euler).^2;  % This is not right edit this!
sum_h = sum(e_heun).^2;

A = 0;
if(sum_e < sum_h)
    A = 1;
end

if ( A == 1 )
  fprintf('Euler is better\n');
else
  fprintf('Heun is better\n');
end;
% This plots the two curves for you. You can use it to diagnose issues.
figure(1);
h_euler = plot(t, p_euler, 'bo-', 'linewidth', 2);
hold on;
h_heun = plot(t, p_heun, 'g-x', 'linewidth', 2);
h_truth = plot(truth(1, :), truth(2, :), 'r-d', 'linewidth', 3);
ylabel('World Population (Millions)', 'fontsize', 20);
xlabel('Year', 'fontsize', 20);
set(gca, 'fontsize', 20);
grid on
legend([h_euler, h_heun, h_truth], 'Euler', 'Heun', 'Actual',...
       'location', 'southeast'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define function here 
function differential = dpdt(p)
    
    k= 0.026;
    px = 12000;
    differential = k.*(1 - p/px).*p;

end