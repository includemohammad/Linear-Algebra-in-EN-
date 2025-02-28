clc;
clear all;
close all;

A = input('Please Enter your Matrix: ');

%% **Step 1: Compute A * A^T Eigenvalues and Eigenvectors**
v = A * A'; 
lambda = eig(v);  
n = length(lambda);  
C_manual = zeros(size(v,1), n);  

for i = 1:n
    I = eye(size(v));  
    B = v - lambda(i) * I;  
    c = null(B);  
    if ~isempty(c)
        C_manual(:, i) = c(:, 1);  
    else
        C_manual(:, i) = NaN;  
    end
end

%% **Step 2: Compute A^T * A Eigenvalues and Eigenvectors**
v1 = A' * A;
lambda1 = eig(v1);  
n1 = length(lambda1);  
C_manual1 = zeros(size(v1,1), n1);  

for i = 1:n1
    I1 = eye(size(v1));  
    B1 = v1 - lambda1(i) * I1;  
    c1 = null(B1);  
    if ~isempty(c1)
        C_manual1(:, i) = c1(:, 1);  
    else
        C_manual1(:, i) = NaN;  
    end
end

%% **Step 3: Construct Sigma Matrix**
sigma = sqrt(lambda1);  
[m, n] = size(A);    
Matrix_sigma = zeros(m, n);  

for k = 1:min(m, n)  % Only fill the diagonal
    Matrix_sigma(k, k) = sigma(k);
end

%% **Step 4: Compute Final SVD Matrices**
U = C_manual;  % U comes from eigenvectors of A*A^T
V = C_manual1; % V comes from eigenvectors of A^T*A
SVD_reconstructed = U * Matrix_sigma * V'; % Compute A using SVD components

%% **Step 5: Display Results**
disp('Sigma Matrix (Singular Value Matrix):');
disp(Matrix_sigma);
disp('Reconstructed A using SVD:');
disp(SVD_reconstructed);
