%% Elementary Matrix Calculation | 63011342 Thanapat Eurboonyanun

% Function Note: This use in LU Factorization to factor finding the
% upper matrix

function [upper, lower, emat, freevar] = elementary_calculate(main_mat, b)
    checker = consistentcy(main_mat, b);
    % main_mat = partial_pivoting(main_mat, b);
    if checker == true
        return
    end
    % main_mat = partial_pivoting(A, b);
    [m, n] = size(main_mat);
    freevar = zeros(1, n);
    if (m ~= n)
        disp('Matrix must be square for this program')
        return 
    end
    if (m == 1) || (n == 1)
        disp('Can not find 1x1 square')
        return
    end
    if det_self2(main_mat) == 0
        disp('Matrix is singular, can not find inverse.')
        return
    end
    counter = 1;
    freevar_counter = 1;
    for i=1:1:n-1
        for j=i+1:1:m
            if main_mat(i,i) == 0
                disp('Detect free variable at x: ');
                disp(i);
                freevar(freevar_counter) = i;
                % freevar_counter = freevar_counter + 1;
%                 e(:,:,counter) = eye(n);
%                 e(j,i,counter) = -main_mat(j,i) / 1;
%                 main_mat = e(:,:,counter) * main_mat;
%                 b = e(:,:,counter) * b;
%                 disp(main_mat);
%                 counter = counter + 1;
%                 continue
            end
            e(:,:,counter) = eye(n);
            e(j,i,counter) = -main_mat(j,i) / main_mat(i,i);
            main_mat = e(:,:,counter) * main_mat;
            b = e(:,:,counter) * b;
            disp(main_mat);
            counter = counter + 1;
        end
    end
    disp('Upper Matrix U: ');
    disp(main_mat);
    disp('Column Matrix b: ');
    disp(b);
    upper = main_mat;
    elementary_matrix = e(:,:,1);
    for k=2:m
        elementary_matrix = e(:,:,k) * elementary_matrix;
    end
    lower_temp = gauss_jordan_inverse(e(:,:,end));
    for l=m-1:-1:1
        lower_temp = gauss_jordan_inverse(e(:,:,l)) * lower_temp;
    end
    lower = lower_temp;
    disp('Combined Elementary Matrix: ');
    disp(elementary_matrix);
    emat = elementary_matrix;
    disp('Lower Matrix: ');
    disp(lower);
    if freevar == zeros(1, n)
        freevar = "None";
    end
%     disp('TEST ELEMENT: ');
%     disp(e(:,:,end))
%     disp('TEST MATLAB: ');
%     disp(inv(e(:,:,end)));
%     disp('DET MATLAB: ');
%     disp(det(e(:,:,end)));
%     disp('TEST CHIC: ');
%     disp(gauss_jordan_inverse(e(:,:,end)));
end