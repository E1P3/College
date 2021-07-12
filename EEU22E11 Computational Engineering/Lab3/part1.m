close all

g = 9.81;
m = 68.1;

t = 0 : 0.1 : 12;
c = [5, 10, 20];

handle_1 = figure(1);



plot(t, parachuteVelocity(c(1), g, m, t), 'r-', 'LineWidth', 2);
hold on;
plot(t, parachuteVelocity(c(2), g, m, t), 'g-', 'LineWidth', 2); 
hold on;
plot(t, parachuteVelocity(c(3), g, m, t), 'b-', 'LineWidth', 2); 
grid on;

plot(t(t==10), 40, "black*", 'markerSize', 10);

xlabel('Time [s]','fontsize',20);
ylabel('Velocity [m/s]','fontsize',20);
legend("c = 5", "c = 10", "c = 20", 'Location', 'SE', 'fontsize', 14);
  
function v = parachuteVelocity(c, g, m, t)

    for n = 1 : length(t)

    v(n) = (g*m/c) * (1 - exp(-c*t(n)/m));

    end

end