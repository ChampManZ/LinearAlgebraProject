%% LU Factorization | 63011342 Thanapat Eurboonyanun

% Theory Note: U comes from the elimination e.g. (E32E31E21)A = U
% L comes from its inverse

function x = lufactorization(A, b)
    disp('Original matrix A: ');
    disp(A);
    [m, n] = size(A);
    L = eye(n);  % Lower
    P = L;  % Permutation
    U = A;  % Upper
end