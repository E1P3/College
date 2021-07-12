close all
clear

% Answer each task in the places shown. The code at the end checks that you
% have created the right variables requested

raw_data = xlsread('muscle_data_2017.xlsx');
strain = raw_data(:,3);
stress = raw_data(:,4);

% Task 1

figure(1);
plot(strain, stress, 'b', 'LineWidth', 3);
xlabel('Strain','fontsize',10);
ylabel('Stress [kPa]','fontsize',10);

% Task 2

m = [3, 4, 5, 6, 7]
sse_per_m = zeros(1,5);
p = zeros(1,5);

for n = 1 : 5
    
    p = polyfit(strain, stress, m(n));
    error_est = stress - polyval(p, strain);
    sse_per_m(n) = sum(error_est.^2);
    
end

figure(2);
plot(m, sse_per_m, 'r', 'LineWidth', 3);
xlabel('polynomial degree','fontsize',10);
ylabel('sum squared error','fontsize',10);

my_m = m(4);

% Task 3

est_stress = polyval(polyfit(strain, stress, my_m), strain);

figure(1);
hold on;
plot(strain, est_stress, 'r','LineWidth',2);

% Task 4

err = stress - est_stress;
error_t = sum((stress - mean(stress)).^2);
ccoef_p = sqrt((error_t - sum(err.^2))/error_t);
standard_error = sqrt(sum(err.^2)/(length(stress) - 2));
str = ['Std error = ', num2str(standard_error),' r =', num2str(ccoef_p)];

figure(3);
histogram(err);
title(str, 'fontsize', 10);
xlabel('Error in polynomial fit','fontsize',10);
ylabel('Frequency','fontsize',10);

% Task 5

a = fminsearch(@(x)func(x, stress, strain),[0.3;0.3;0.3]);
est_stress = 1 - a(3) - (a(1).*exp(a(2).*strain));
figure(1);
hold on;
plot(strain, est_stress, 'k-', 'linewidth', 2);

% Task 6

err_nl = stress - est_stress;
ccoef_nl = sqrt((error_t - sum(err_nl.^2))/error_t);
standard_error = sqrt(sum(err_nl.^2)/(length(stress) - 2));
str = ['Std error = ', num2str(standard_error),' r =', num2str(ccoef_nl)];

figure(4);
histogram(err_nl);
title(str, 'fontsize', 10);
xlabel('Error in polynomial fit','fontsize',10);
ylabel('Frequency','fontsize',10);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The lines below here just check that you have addressed the variables
% required in the assignment.

%Check my variables
if (~exist('a'))
    fprintf('\nVariable "a" does not exist.')
end;
if (~exist('err_nl'))
    fprintf('\nVariable "err_nl" does not exist.')
end;
if (~exist('ccoef_nl'))
    fprintf('\nVariable "ccoef_nl" does not exist.')
end;
if (~exist('ccoef_p'))
    fprintf('\nVariable "ccoef_p" does not exist.')
end;
if (~exist('est_stress'))
    fprintf('\nVariable "est_stress" does not exist.')
end;
if (~exist('my_m'))
    fprintf('\nVariable "my_m" does not exist.')
end;
if (~exist('sse_per_m'))
    fprintf('\nVariable "sse_per_m" does not exist.')
end;
fprintf('\n');
