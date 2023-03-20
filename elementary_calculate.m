%% Elementary Matrix Calculation | 63011342 Thanapat Eurboonyanun

% Function Note: This use in LU Factorization to factor finding the
% upper matrix

function [upper, lower, emat] = elementary_calculate(A, b)
    [m, n] = size(A);
    if (m ~= n)
        disp('Matrix must be square for this program')
        return
    end
    counter = 1;
    for i=1:1:n-1
        for j=i+1:1:m
            e(:,:,counter) = eye(n);
            e(j,i,counter) = -A(j,i) / A(i,i);
            A = e(:,:,counter) * A;
            b = e(:,:,counter) * b;
            disp(A);
            counter = counter + 1;
        end
    end
    disp('Upper Matrix U: ');
    disp(A);
    disp('Column Matrix b: ');
    disp(b);
    upper = A;
    elementary_matrix = e(:,:,1);
    for k=2:m
        elementary_matrix = e(:,:,k) * elementary_matrix;
    end
    lower_temp = matrix_invert_self(e(:,:,end));
    for l=m-1:-1:1
        lower_temp = matrix_invert_self(e(:,:,l)) * lower_temp;
    end
    lower = lower_temp;
    disp('Combined Elementary Matrix: ');
    disp(elementary_matrix);
    emat = elementary_matrix;
    disp('Lower Matrix: ');
    disp(lower);
end