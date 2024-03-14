
x_values = [1, 4, 6, 8];
f_values = [0, 1.39, 1.79, 2.08];
x_interpolate = 2;


x0 = x_values(1);
f0 = f_values(1);
x1 = x_values(2);
f1 = f_values(2);
f_linear = f0 + ((x_interpolate - x0) * (f1 - f0)) / (x1 - x0);


x2 = x_values(3);
f2 = f_values(3);
f_lagrange = (f0 * (x_interpolate - x1) * (x_interpolate - x2)) / ((x0 - x1) * (x0 - x2)) + ...
             (f1 * (x_interpolate - x0) * (x_interpolate - x2)) / ((x1 - x0) * (x1 - x2)) + ...
             (f2 * (x_interpolate - x0) * (x_interpolate - x1)) / ((x2 - x0) * (x2 - x1));


disp(['Linear Interpolation f(2) = ', num2str(f_linear)]);
disp(['Lagrange Polynomial Interpolation f(2) = ', num2str(f_lagrange)]);


extended_x_values = [1, 2, 4, 6, 8]; % Include the interpolated point
extended_f_values_linear = [0, f_linear, 1.39, 1.79, 2.08];
extended_f_values_lagrange = [0, f_lagrange, 1.39, 1.79, 2.08];


figure;
plot(extended_x_values, extended_f_values_linear, 'o-', 'LineWidth', 2);
hold on;
plot(extended_x_values, extended_f_values_lagrange, 's-', 'LineWidth', 2);
title('Graph of f(x) vs x');
xlabel('x');
ylabel('f(x)');
legend('Linear Interpolation', 'Lagrange Polynomial Interpolation', 'Location', 'NorthWest');
grid on;
