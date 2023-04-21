function A_inv = gauss_jordan_inverse(A)
% Check if the input is a square matrix
if size(A,1) ~= size(A,2)
    A_inv = [];
    return;
end

% Create an augmented matrix with identity matrix as the right-hand side
n = size(A,1);
aug_matrix = horzcat(A, eye(n));

% Perform row operations to transform the left side to identity matrix
for i = 1:n
    % Check if diagonal element is zero
    if aug_matrix(i, i) == 0
        A_inv = [];
        return;
    end
    
    % Divide the current row by the diagonal element to make it one
    aug_matrix(i, :) = aug_matrix(i, :) ./ aug_matrix(i, i);
    
    % Subtract the current row from all other rows to make their corresponding
    % element zero
    for j = 1:n
        if i ~= j
            aug_matrix(j, :) = aug_matrix(j, :) - aug_matrix(j, i) * aug_matrix(i, :);
        end
    end
end

% Return the right side of the augmented matrix as the inverse of A
A_inv = aug_matrix(:, n+1:end);

end