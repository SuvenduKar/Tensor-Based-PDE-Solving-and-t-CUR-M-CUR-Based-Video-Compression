function B = ein_transpose(A)
    dimensions = size(A);
    % Number of dimensions in A
    N = numel(dimensions) / 2; % Assuming A is N x N tensor
    % Rearrange the dimensions for the transpose operation
    newOrder = [N+1:2*N, 1:N];
    % Permute the dimensions of A according to the new order
    B = permute(A, newOrder);
end