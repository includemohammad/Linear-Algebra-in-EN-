clc;
clear all;
close all;


V = input('Please enter your matrix V (columns are vectors): ');

[m, n] = size(V); 
W = zeros(m, n);  


for i = 1:n
    W(:, i) = V(:, i); 
    
    for j = 1:i-1
        W(:, i) = W(:, i) - (dot(W(:, j), V(:, i)) / dot(W(:, j), W(:, j))) * W(:, j);
    end
    
   
    W(:, i) = W(:, i) / norm(W(:, i));
end


disp('Orthonormal basis (columns of W):');
disp(W);
