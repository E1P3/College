%Red Bull Data plotted.
close all
clear 

% Read data from file
% First column is time in secs
% Second column is velocity
% Third column is theoretical terminal velocity at that time
jumpdata = csvread('RedBullJumpData.csv');
t_redbull = jumpdata(:,1);
v_redbull = jumpdata(:,2);
terminal_velocity = jumpdata(:,3);
N_timestamps = length(t_redbull);

%Calculate freefall velocity vector here
m = 70;
g = 9.81;
v_freefall = t_redbull*g;

% Part 1
% We are giving you this answer for free
figure(1);
h_part1 = plot(t_redbull, v_redbull, 'r-x', 'linewidth', 2.0);
shg;
hold on;

% Part 2
% This plot does not have the right linewidth. You fix it.
h_part2 = plot(t_redbull, v_freefall, 'b--','LineWidth',2.0); 
shg;
% This is how to put on a grid 
grid on;
% This is how to fix an axis to a desired size
axis([0,180,0,400]);
% Set the fontsize and label the graph here!!
xlabel('Time (secs)', 'fontsize', 20);
ylabel('Velocity (m/s)', 'fontsize', 20);
% Calculate when he hits the atmosphere
% Part  3
% Need some stuff here ... or read it off from the graph
hit_instant = 50;

for n = 1 : N_timestamps - 1
    error = abs(v_freefall(n) - v_redbull(n))/v_freefall(n);
    %seems like its at 50 right after he reaches max speed, but the brief
    %says 5% difference so I'm staying with that I guess
    if(error >= 0.05)
        hit_instant = t_redbull(n);
        break;
    end
end

fprintf('Mr. B hits the earth''s atmoshpere at %f secs after he jumps\n',...
       hit_instant);

% Part 4
% Now starting from the velocity and time = 56 secs 
% .. let's update and calculate v
g = 9.81;
v_numerical_1 = zeros(1, N_timestamps);
drag_constant = 3/60;
start = find(t_redbull == 56);
% Starting from this time instant, calculate the velocity required



for n = 1 : 16
    v_numerical_1(n) = v_redbull(n);
end

for n = 16 : (N_timestamps - 1)
    v_numerical_1(n+1) = v_numerical_1(n) + (g - v_numerical_1(n)*drag_constant)*(t_redbull(n+1) - t_redbull(n));
end

% Plot using the dashed green line
h_part4 = plot(t_redbull, v_numerical_1, 'g--','linewidth',2.0);shg

% Part 5 
% Calculate the percentage error as required

per_error = zeros(1, 2); % This is just some random number .. which is wrong
per_error(1) = abs((v_redbull(20) - v_numerical_1(20))/ v_redbull(20) * 100);
per_error(2) = abs((v_redbull(37) - v_numerical_1(37))/ v_redbull(37) * 100);

fprintf('The percentage error at 64 and 170 secs is %1.1f and\n', per_error(1));
fprintf('%3.1f  respectively \n', per_error(2));


% Part 6 
% Expected you to guess a good value for drag_constant
% This can be done by trying some values and measuring the error at t-69
% secs each time. When that error satisfies your criterion, then you say right thats
% my value for drag_constant.
est_drag_constant = 4/60; % This is just some value, you have to estimate a better one.
% A hint here that now you have to calculate the velocity using this drag
% constant .. put it in v_numerical_2

v_numerical_2 = zeros(1, length(t_redbull(21:end)) - 1);

v_numerical_2(1) = v_redbull(20) + (g - v_redbull(20)*est_drag_constant)*(t_redbull(20) - t_redbull(19));

for n = 1 : length(t_redbull(21:end)) - 1
    v_numerical_2(n+1) = v_numerical_2(n) + (g - v_numerical_2(n)*est_drag_constant)*(t_redbull(n+20) - t_redbull(n+19));
end

% This is the handle plot for part 6. You have to plot the right stuff not
% this stuff.
% Note that the plot linewidth and colour are wrong. Fix it.
h_part6 = plot(t_redbull(21:end), v_numerical_2, 'k--');
shg

est_error = abs(v_redbull(21) - v_numerical_2(1))/ v_redbull(21);
fprintf('The error at t = 69 secs using my estimated drag information is %f\n', est_error);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DO NOT EDIT BELOW THIS LINE THIS IS TO MAKE SURE YOU HAVE USED THE
% VARIABLES THAT WE ASKED FOR
% Check for existence of variables
if (~exist('v_freefall', 'var'))
  error('The variable v_freefall does not exist.')
end;
if (~exist('hit_instant', 'var'))
  error('The variable hit_instant does not exist.')
end;
if (~exist('per_error', 'var'))
  error('The variable per_error does not exist.')
end;
if (exist('per_error', 'var'))
  l = size(per_error);
  if ( sum(l - [1 2]) ~= 0)
    error('per_error is not a 2 element vector. Please make it so.')
  end;
end;
if (~exist('v_numerical_1', 'var'))
  error('The variable v_numerical_1 does not exist.')
end;  
if (~exist('est_error', 'var'))
  error('The variable est_error does not exist.')
end;  
if (~exist('h_part1', 'var'))
  error('The plot handle h_part11 is missing. Please create it as instructed.')
end;
if (~exist('h_part2', 'var'))
  error('The plot handle h_part11 is missing. Please create it as instructed.')
end;
if (~exist('h_part4', 'var'))
  error('The plot handle h_part11 is missing. Please create it as instructed.')
end;
if (~exist('h_part6', 'var'))
  error('The plot handle h_part11 is missing. Please create it as instructed.')
end;


