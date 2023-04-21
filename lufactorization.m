%% LU Factorization | 63011342 Thanapat Eurboonyanun

% Function Note: Find x using LU Factorization

% Theory Note: U comes from the elimination e.g. (E32E31E21)A = U
% L comes from its inverse

% Theory Note: Ux = y
% Ly = b

function x = lufactorization(A, b)
    [U, L, E] = elementary_calculate(A, b);
    y = L\b;
    x = U\y;
    disp('x: ');
    disp(x);
end