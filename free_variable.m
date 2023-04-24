function free_variable(A)
    % Define the augmented matrix
    A_aug = [A eye(size(A,1))];
    
    % Perform Gaussian elimination with partial pivoting
    for i = 1:size(A,1)-1
        % Find the maximum element below the current pivot
        max_val = abs(A_aug(i,i));
        max_row = i;
        for j = i+1:size(A,1)
            if abs(A_aug(j,i)) > max_val
                max_val = abs(A_aug(j,i));
                max_row = j;
            end
        end
        % Swap the current row with the row containing the maximum element
        temp = A_aug(i,:);
        A_aug(i,:) = A_aug(max_row,:);
        A_aug(max_row,:) = temp;
        % Eliminate the elements below the pivot
        for j = i+1:size(A,1)
            factor = A_aug(j,i)/A_aug(i,i);
            A_aug(j,:) = A_aug(j,:) - factor*A_aug(i,:);
        end
    end
    
    % Check if the matrix has a free variable
    if rank(A) < rank(A_aug(:,1:size(A,1)))
        % Display the solutions with a free variable
        fprintf('The matrix has a free variable.\n');
        free_col = find(any(A_aug(:,1:size(A,1)),1));
        sol = zeros(size(A,1),1);
        sol(free_col) = 1;
        for i = size(A,1):-1:1
            for j = i+1:size(A,1)
                sol(i) = sol(i) - A_aug(i,j)*sol(j);
            end
            sol(i) = sol(i)/A_aug(i,i);
        end
        fprintf('x = [');
        for i = 1:size(sol,1)-1
            fprintf('%f; ',sol(i));
        end
        fprintf('%f]\n',sol(end));
    else
        % Display the unique solution
        fprintf('The matrix has a unique solution.\n');
        sol = A_aug(:,1:size(A,1))\A_aug(:,size(A,1)+1:end);
        fprintf('x = [');
        for i = 1:size(sol,1)-1
            fprintf('%f; ',sol(i));
        end
        fprintf('%f]\n',sol(end));
    end
end