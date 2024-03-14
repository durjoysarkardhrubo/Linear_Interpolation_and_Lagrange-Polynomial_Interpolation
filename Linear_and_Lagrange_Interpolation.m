
filepath = 'C:\Users\durjo\OneDrive\Desktop\lab8\input.txt';
data = readmatrix(filepath);
x_values = data(:, 1);
f_values = data(:, 2);
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


extended_x_values = [x_values(1), x_interpolate, x_values(2:end)']; 
extended_f_values_linear = [f_values(1), f_linear, f_values(2:end)'];
extended_f_values_lagrange = [f_values(1), f_lagrange, f_values(2:end)'];


figure;
plot(extended_x_values, extended_f_values_linear, 'o-', 'LineWidth', 2);
hold on;
plot(extended_x_values, extended_f_values_lagrange, 's-', 'LineWidth', 2);
title('Graph of f(x) vs x');
xlabel('x');
ylabel('f(x)');
legend('Linear Interpolation', 'Lagrange Polynomial Interpolation', 'Location', 'NorthWest');
grid on;


output_filepath = 'C:\Users\durjo\OneDrive\Desktop\lab8\output.txt';
fileID = fopen(output_filepath, 'w'); 

if fileID == -1
    error('Failed to open file for writing.');
end

fprintf(fileID, 'Linear Interpolation f(2) = %.4f\n', f_linear);
fprintf(fileID, 'Lagrange Polynomial Interpolation f(2) = %.4f\n', f_lagrange);

fclose(fileID); 
