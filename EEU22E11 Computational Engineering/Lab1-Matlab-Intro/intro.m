% Cone parameters
r = 5;
h = 12;

% Calculate the volume
vol = pi * r * r * h/3;

% Calculate the volume vector 'volumes'
r_vals = [0, 1,3.3,4,5];
volumes = pi* r_vals .* r_vals * h/3;

% Plot r_vals versus volumes. Use the plot function!
% Don't forget to render the plot handle 'graph_properties'
figure(1);
graph_properties = plot(r_vals, volumes, 'r-');
set(graph_properties, 'linewidth', 3);
xlabel('Radius', 'fontsize', 20);
ylabel('Volumes', 'fontsize', 20);