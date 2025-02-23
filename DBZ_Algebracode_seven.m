clc ;
clear all 
close all 


A =[3 1 -2 ;-1 4 -3 ;1 -1 4 ];
B = [9 ;-8;1];
n = length(B);
for k = 1:n-1
    for i = k+1:n
        factor = A(i,k) / A(k,k);
        A(i, k:n) = A(i, k:n) - factor * A(k, k:n); 
        B(i) = B(i) - factor * B(k); 
    end
end

X = zeros(n,1); 
for i = n:-1:1
    X(i) = (B(i) - A(i, i+1:n) * X(i+1:n)) / A(i,i);
end

disp('Result : ')
disp(X)
