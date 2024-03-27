sample_ratio=[0.01*a,0.02*a,0.03*a,0.04*a,0.05*a,0.06*a,0.07*a,0.08*a,0.09*a,0.1*a,0.2*a,0.3*a,0.4*a,0.5*a,0.6*a,0.7*a,0.8*a,0.9*a,a];
%Use the same A
[m, n, ~] = size(A);  % RGB image has three channels
image=A;
error_list_cur=zeros(1,length(sample_ratio));

for j=1:length(sample_ratio)
    % Perform SVD on the reshaped matrix
    tic;
    [C, U, R] = TENSOR_CUR(image,sample_ratio(j),sample_ratio(j));
    % Reshape matrices U, S, and V for multiplication
    %U_reshaped = reshape(U, [], m, 3);  % Reshape U to n1-by-(n1*n3)
    %S_reshaped = reshape(S, m, n, 3);  % Reshape S to n1-by-n2-by-n3
    %V_reshaped = reshape(V, [], n, 3);  % Reshape V to n2-by-(n2*n3)
    %disp(size(U));
    %disp(size(V));
    %disp(size(S));
    result=TPRODp(3,TPRODp(3,C,U),R);
    error_list_cur(j)=frob_norm(image-result)/frob_norm(image);
    toc;
    % Display the image
    %imshow(result);
    
    % Generate the filename for this iteration
    %filename = sprintf('image_%d.png', num_singular_values(j));  % Example filename pattern
    
    % Save the image to a file
    %imwrite(result, filename);  % Save as PNG format
end
disp('Error list is:')
disp(error_list_cur)