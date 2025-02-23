function [x, AB] = gaussian(A, B)
    NA = size(A,1); % Number of rows in matrix A
    NB = size(B,2); % Number of columns in matrix B
    
    % Check if the dimensions are valid
    if size(A,2) ~= NA || size(B,1) ~= NA
        error('Invalid matrix dimensions.');
    end

    % Augmented matrix [A | B]
    AB = [A B]; 

    % Forward Elimination
    for j = 1:NA-1
        if AB(j,j) == 0  % Check for pivoting necessity
            error('Pivoting is required!');
        end
        for i = j+1:NA
            factor = AB(i,j) / AB(j,j); % Compute factor for elimination
            AB(i, j:NA+1) = AB(i, j:NA+1) - factor * AB(j, j:NA+1); % Row reduction
        end
    end

    % Back Substitution
    x = zeros(NA,1); % Solution vector
    for i = NA:-1:1
        x(i) = (AB(i, NA+1) - AB(i, i+1:NA) * x(i+1:NA)) / AB(i, i);
    end
end
