function mat = partial_pivoting(A,b)
    [m,n] = size(A); % checking the size of matrix
    %==========================================================================
    % Initialization
    x = zeros(m,1);
    l = zeros(m,m-1);
    
    %==========================================================================
    % Main Program
    %==========================================================================
    
    % Reducing Matrix A to upper triangular form
    
    for k = 1:m-1
        % =========Performing Partial-pivoting=================================
            for p = k+1:m
                if (abs(A(k,k)) < abs(A(p,k)))
                    A([k p],:) = A([p k],:);
                      b([k p]) = b([p k]);
                end
            end
    end
    mat = A;
end