% Load problem parameters
g  = 9.81; % gravitational force
m  = 68.1; % mass of parachutist


% ======================= TASK 3 Calculate and plot f(c) in Figure 1 =======================
% Defining vector parameters
c = (1:0.5:25); % Put a range of c here for plotting the error (f(c)) in figure 1
c_est = zeros(1,length(c)); % Initialise c_est so you can use it later if you want

plot_length = 5;

err = zeros(1,plot_length);
e_vec = zeros(1,plot_length);
% Initializing other parameters
zer = zeros(1,length(c_est));
c_est(1)= 8;
% Use the function parError to determine the error for various values of c

% Plotting the curve of f(c) versus c
% Remember that we are plotting these things in figure(1)
h1 = figure(1);

% Plot things here


plot( c, parError(c,m,g), "r", "linewidth" , 3);
hold on;
plot(c,zeros(1,length(c_est)),'black', 'linewidth', 3);
hold on;
plot (8, -0.2121, "b.", 'markerSize',20);

grid on;

title("Error as a function of c",'fontsize', 20);
xlabel("Drag coefficient c", 'fontsize', 20);
ylabel("Error", 'fontsize', 20);

axis([1 25 -0.3 0.6]);  % This will limit your axes to the values we want
% =====================================================================


% ========================== SOLVING THE ROOT (TASK 4) GOES HERE ==========================
% Newton-Raphson loop
% Set your termination conditions and your starting point c_est(1) = 8.0
maxIters = 10; % Change this! We suggest to use this to set the max iterations allowed
maxStepDiff = 0.01; %Change this! We suggest to use this to set the maximum step allowed
stepDiff = 1; %Change this! We suggest to use this to measure the step betwen c_n and c_n-1 at every iteration
iteration = 1; % This is our suggested iteration counter
while ( (abs(stepDiff) > maxStepDiff) && (iteration < maxIters) ) % and this is our suggested loop
    % Calculate the function value at this estimate of c,  c_est(iteration)
    
    e_vec(iteration) = parError(c_est(iteration),m,g);

    % Calculate the gradient
    err(iteration) = pardError(c_est(iteration),m,g);
    
    % Apply the Newton-Rhapson update to c_est(iteration)
    
    c_est(iteration+1) = c_est(iteration) - (e_vec(iteration))/( err(iteration));
    
    % Print out the current status of yourr iterations here
    fprintf('Current error is %s, c = %f, iteration = %d \n', c_est(iteration), e_vec(iteration),err(iteration));
    
    % Update the step difference
    
    stepDiff = abs(c_est(iteration+1) - c_est(iteration));
    % Increment the counter
    
    iteration = iteration + 1;
end % This ends the while loop. If you change the loop you might have to change this too.


% ========================== Plot your convergence curve here (Task 5) ==========================
% Plotting for figure 2
h2 = figure(2); % remember we want this curve to appear in Figure 2

% plot code goes here
plot((1:plot_length),abs(e_vec(1:plot_length)), 'r-X','linewidth', 2);
grid on;

title("Absolute error per iteration",'fontsize', 20);
xlabel("Iteration", 'fontsize', 20);
ylabel("Absolute Error", 'fontsize', 20);


% ============================================================================


% Test parError and pardError functions

testParError  = parError(  1:0.5:20, 70, 10 );
testPardError = pardError( 1:0.5:20, 70, 10 );

% ============================== Local Student Functions ==============================

function error = parError( c, m, g)
% ================== TASK 1 CODE GOES HERE ===================
% Calculate the error given an estimate of c
  
 error = (40*c)/(m*g) - (1 - exp(-((10*c)/m)));   
      
% ============================================================
end

function dError = pardError( c, m, g)
% ================== TASK 2 CODE GOES HERE ===================
% Calculate the derivative of the error given an estimate of c
   
dError = 40/(m*g) - (10/m) * exp((-10/m)*c);    
    
% ============================================================
end
