%% LU Factorization | 63011342 Thanapat Eurboonyanun

% Function Note: Find x using LU Factorization

% Theory Note: U comes from the elimination e.g. (E32E31E21)A = U
% L comes from its inverse

% Theory Note: Ux = y
% Ly = b

% Function Note: If 100x100 matrix, it takes around 1 minutes and 30 sec

function x = lufactorization(A, b)
    [U, L, E, FV] = elementary_calculate(A, b);
    y = L\b;
    x = U\y;
    if FV == "None"
        disp('x: ');
        disp(x);
    end
    disp('Free variable at x:');
    disp(FV);
end