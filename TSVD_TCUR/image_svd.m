num_singular_values=[1,5,10,15,20,25,30,35,40,50,60,70,90,100,120,140,160,180,200,220,240,250,256];
% Read the image
image = imread('resized_svdimage.jpg');%We know our image is of size 256*256*3

% Convert the image to double precision
image = im2double(image);

% Get the dimensions of the image
[m, n, ~] = size(image);  % RGB image has three channels

% Reshape the image into a matrix where each column represents a pixel
X = reshape(image, [], 3);  % Reshape to m*n-by-3 matrix
%X=image;
error_list=zeros(1,length(num_singular_values));
for j=1:length(num_singular_values)
    % Perform SVD on the reshaped matrix
    [U, S, V] = T_svd_reduced_singular(image,num_singular_values(j));
    % Reshape matrices U, S, and V for multiplication
    %U_reshaped = reshape(U, [], m, 3);  % Reshape U to n1-by-(n1*n3)
    %S_reshaped = reshape(S, m, n, 3);  % Reshape S to n1-by-n2-by-n3
    %V_reshaped = reshape(V, [], n, 3);  % Reshape V to n2-by-(n2*n3)
    %disp(size(U));
    %disp(size(V));
    %disp(size(S));
    result=T_product(T_product(U,S),T_transpose(V));
    error_list(j)=frob_norm(image-result)/frob_norm(image);
    % Display the image
    imshow(result);
    
    % Generate the filename for this iteration
    filename = sprintf('image_%d.png', num_singular_values(j));  % Example filename pattern
    
    % Save the image to a file
    imwrite(result, filename);  % Save as PNG format
end

%disp(error_list);
plot(num_singular_values, error_list, 'o-', 'LineWidth', 2);

% Add labels and title
xlabel('Number of retained singular values');
ylabel('Relative error in approximation');
title('Singular values vs Error');

% Add grid
grid on;
