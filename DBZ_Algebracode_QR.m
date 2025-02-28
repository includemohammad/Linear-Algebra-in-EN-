clc;
clear all;
close all;

A = input('Please Enter your Matrix: ');

%% Gram-Schmidt Algorithm for Orthogonalization
[m, n] = size(A);
W = zeros(m, n);

for i = 1:n
    W(:, i) = A(:, i);
    
    for j = 1:i-1
        W(:, i) = W(:, i) - (dot(W(:, j), A(:, i)) / dot(W(:, j), W(:, j))) * W(:, j);
    end
    
    W(:, i) = W(:, i) / norm(W(:, i));
end

%% QR Decomposition: R = Q^T * A
Q = W; % ماتریس متعامد
R = Q' * A; % محاسبه‌ی R
disp('This is R for QR Analysis:');
disp(R);
