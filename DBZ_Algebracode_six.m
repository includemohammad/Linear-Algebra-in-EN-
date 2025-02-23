tic
    clc ;
    close all 
    clear all 


    % A = input('Please Enter your Matrix  : ' ) ; This code when your in
    % put any matrix 
     A = [1/sqrt(15)*(2+1i) 1/sqrt(15)*(3+1i);1/sqrt(15)*(-3+1i) 1/sqrt(15)*(2-1i)];

    [n, m] = size(A);
    if n ~= m
        error('The Matrix dosnt squre !!');
    end
    
    
    detA = det(A);
    if detA == 0
        error('The Matrix dont have A^-1 !!');
    end
    
    
    C = zeros(n);
    for i = 1:n
        for j = 1:n
            
            minor_ij = A;
            minor_ij(i, :) = [];  %  cancel of row  
            minor_ij(:, j) = [];  % cancel of colum 
            
            %this for Cofactor this Matrix
            C(i, j) = (-1)^(i + j) * det(minor_ij);
        end
    end
    
    adjA = C';

    A_inv = adjA / det(A);
    A_star = (-1).*((A_inv)') ;
   
toc
