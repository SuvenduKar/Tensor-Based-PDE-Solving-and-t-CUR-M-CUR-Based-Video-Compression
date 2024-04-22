function C = kmode_product(A, B)
    % Check compatibility of dimensions
    [n1, n2, n3] = size(A);
    [n4, n5] = size(B);
    
    if n3 ~= n5
        error('Dimension is incompatible');
    end

    % Create tensor C
    C = zeros(n1, n2, n4);
    
    % Compute C
    for i = 1:n1
        for j = 1:n2
            for k = 1:n4
                % Perform the summation for k-mode product
                for m = 1:n3
                    C(i, j, k) = C(i, j, k) + A(i, j, m) * B(k, m);
                end
            end
        end
    end
end


