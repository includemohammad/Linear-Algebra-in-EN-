clc;
clear all;
close all;

syms x;


A = @(x) cos(x);


N_values = [2, 4, 6, 8, 10];

x_vals = linspace(-1, 1, 200);  
y_vals = arrayfun(A, x_vals); 


figure;
plot(x_vals, y_vals, 'k-', 'LineWidth', 2); hold on;  


colors = {'b', 'r', 'g', 'm', 'c'}; 
legend_labels = {'Original Function'}; 

for j = 1:length(N_values)
    N = N_values(j);
    
    
    P = sym(zeros(N+1,1));
    P(1) = 1;
    P(2) = x;
    
    for n = 1:N-1
        P(n+2) = ((2*n+1) * x * P(n+1) - n * P(n)) / (n+1);
    end
    
    % محاسبه تقریب لژاندر
    f = sym(zeros(N,1));
    for i = 1:N
        f(i) = (1/2) + ((-1)^i * (4*i + 0.3) * factorial(2*i)) / ...
               (((2)^(2*i + 2)) * factorial(i+1) * factorial(i)) * P(i+1);
    end
    
   
    approx_vals = double(subs(sum(f), x, x_vals));
    
   
    plot(x_vals, approx_vals, '-', 'Color', colors{j}, 'LineWidth', 2);
    
    
    legend_labels{end+1} = ['Legendre Approximation (N = ' num2str(N) ')'];
end

xlabel('x');
ylabel('Function Value');
title('Legendre Polynomial Approximation of sin(x)');
legend(legend_labels, 'Location', 'best');  % نمایش legend
grid on;
hold off;
