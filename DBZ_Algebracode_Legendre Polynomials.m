clc;
clear all;
close all;

N = input('Please input the number of N: ');
x = input('Please input the value of x: '); 

P = zeros(N+1,1); 


P(1) = 1;  
P(2) = x;   

for n = 1:N-1
    P(n+2) = ((2*n+1) * x * P(n+1) - n * P(n)) / (n+1);
end

disp('Legendre Polynomials:');
disp(P);

