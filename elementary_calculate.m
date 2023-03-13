%% Elementary Matrix Calculation | 63011342 Thanapat Eurboonyanun

% Function Note: This use in LU Factorization to factor finding the
% upper matrix

function [u, emat] = elementary_calculate(A, b)
    disp('Original coefficient matrix A: ');
    disp(A);
    disp('Original Column matrix b: ');
    disp(b);
    [m, n] = size(A);
    fprintf('A has a size of %ix%i matrix\n', m, n);
    counter = 1;
    for i=1:1:n-1
        for j=i+1:1:m
            e(:,:,counter) = eye(n);
            e(j,i,counter) = -A(j,i) / A(i,i);
            A = e(:,:,counter) * A;
            b = e(:,:,counter) * b;
            counter = counter + 1;
        end
    end
    disp('Upper Matrix U: ');
    disp(A);
    disp('Column Matrix b: ');
    disp(b);
    u = A;
    elementary_matrix = e(:,:,1);
    for k=2:m
        elementary_matrix = e(:,:,k) * elementary_matrix;
        disp(elementary_matrix);
    end
    disp('Combined Elementary Matrix: ');
    disp(elementary_matrix);
    emat = elementary_matrix;
end