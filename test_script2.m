function [L,U,P] = test_script2(A)
% This function computes the LU factorization of a given matrix A using Gaussian elimination with partial pivoting

% Get the size of the matrix A
n = size(A,1);

% Initialize the lower triangular matrix L, the upper triangular matrix U, and the permutation matrix P
L = eye(n);
U = A;
P = eye(n);

% Perform Gaussian elimination with partial pivoting
for k = 1:n-1
    % Find the pivot row with the largest absolute value in the current column
    [~, pivot_row] = max(abs(U(k:n,k)));
    pivot_row = pivot_row + k - 1;
    
    % Swap rows k and pivot_row in U, L, and P
    U([k,pivot_row],k:n) = U([pivot_row,k],k:n);
    L([k,pivot_row],1:k-1) = L([pivot_row,k],1:k-1);
    P([k,pivot_row],:) = P([pivot_row,k],:);
    
    % Compute the multipliers for the current column
    multipliers = U(k+1:n,k) / U(k,k);
    
    % Update the lower triangular matrix L and the upper triangular matrix U
    L(k+1:n,k) = multipliers;
    U(k+1:n,k:n) = U(k+1:n,k:n) - multipliers * U(k,k:n);
end