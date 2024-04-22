function tensor_r = kron_tensors(tensor1, tensor2)

% Check if the input tensors are 3D arrays (tensors)
if ndims(tensor1) ~= 3 || ndims(tensor2) ~= 3
    error('Input tensors must be 3D arrays');
end

% Get the size of each tensor
sz1 = size(tensor1);
sz2 = size(tensor2);

% Compute the size of the resulting tensor
sz_r = sz1 .* sz2;

% Initialize the resulting tensor
tensor_r = zeros(sz_r);

% Compute the kronoker product of the two tensors
for i = 1:sz1(1)
    for j = 1:sz1(2)
        for k = 1:sz1(3)
            for m = 1:sz2(1)
                for n = 1:sz2(2)
                    for p = 1:sz2(3)
                        % Compute the linear index of tensor_r
                        idx = (i-1)*prod(sz2) + (m-1)*prod(sz2(2:3)) + (n-1)*sz2(3) + p;

                        % Assign the product of tensor1 and tensor2 to tensor_r
                        tensor_r(idx) = tensor1(i, j, k) * tensor2(m, n, p);
                    end
                end
            end
        end
    end
end

end