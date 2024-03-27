A=randi([0,0],[1000,1000,3]);
a=1000;
sample_ratio=[0.01*a,0.02*a,0.03*a,0.04*a,0.05*a,0.06*a,0.07*a,0.08*a,0.09*a,0.1*a];
for i=1:3
   % Initialize matrix with rank less than 4
    A(:,:,i) = rand(1000);

    % Ensure the matrix has full rank
    while rank(A(:,:,i)) ~= 1000
        A(:,:,i) = rand(1000);
    end

end
[m, n, ~] = size(A);  % RGB image has three channels
image=A;
error_list_svd=zeros(1,length(sample_ratio));

for j=1:length(sample_ratio)
    % Perform SVD on the reshaped matrix
    tic;
    [U, S, V] = T_svd_reduced_singular(image,sample_ratio(j));
    % Reshape matrices U, S, and V for multiplication
    %U_reshaped = reshape(U, [], m, 3);  % Reshape U to n1-by-(n1*n3)
    %S_reshaped = reshape(S, m, n, 3);  % Reshape S to n1-by-n2-by-n3
    %V_reshaped = reshape(V, [], n, 3);  % Reshape V to n2-by-(n2*n3)
    %disp(size(U));
    %disp(size(V));
    %disp(size(S));
    result=T_product(T_product(U,S),T_transpose(V));
    error_list_svd(j)=frob_norm(image-result)/frob_norm(image);
    toc;
    % Display the image
    %imshow(result);
    
    % Generate the filename for this iteration
    %filename = sprintf('image_%d.png', num_singular_values(j));  % Example filename pattern
    
    % Save the image to a file
    %imwrite(result, filename);  % Save as PNG format
end
disp('Error list is:')
disp(error_list_svd)