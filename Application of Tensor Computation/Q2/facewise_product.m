% Define the function facewise_product
function C = facewise_product(A, B)
    % Check compatibility of dimensions
    [n1, n2, n3] = size(A);
    [n4, n5, n6] = size(B);
    
    if n2 ~= n4 || n3 ~= n6
        error('Dimension is incompatible');
    end

    % Create tensor C
    C = zeros(n1, n5, n6);
    
    % Compute C
    for i = 1:n6
        C(:, :, i) = A(:, :, i) * B(:, :, i);
    end
end


