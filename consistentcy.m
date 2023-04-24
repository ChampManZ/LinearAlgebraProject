function bool = consistentcy(A, b)
    % check the consistency of the matrix
    checker = false;
    if rank([A, b]) == rank(A)
        warning('Matrix is consistent');
    else
        warning('Matrix is inconsistent');
        checker = true;
    end
    bool = checker;
end