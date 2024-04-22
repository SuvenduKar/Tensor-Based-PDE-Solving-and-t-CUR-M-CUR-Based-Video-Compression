num_row_col=[256];
% Read the image
image = imread('videoframes/frame_1.png');%We know our image is of size 256*256*3

% Convert the image to double precision
image = im2double(image);
%image = randi([0, 0], [256,256,3]);
%for i =1:3
    %image(:,:,i)=i*eye(256);
%end
% Get the dimensions of the image
[m, n, ~] = size(image);  % RGB image has three channels

% Reshape the image into a matrix where each column represents a pixel
X = reshape(image, [], 3);  % Reshape to m*n-by-3 matrix
%X=image;
error_list_cur=zeros(1,length(num_row_col));

for j=1:length(num_row_col)
    % Perform SVD on the reshaped matrix
    [C, U, R] = TENSOR_TCUR(image,num_row_col(j),num_row_col(j));
    % Reshape matrices U, S, and V for multiplication
    %U_reshaped = reshape(U, [], m, 3);  % Reshape U to n1-by-(n1*n3)
    %S_reshaped = reshape(S, m, n, 3);  % Reshape S to n1-by-n2-by-n3
    %V_reshaped = reshape(V, [], n, 3);  % Reshape V to n2-by-(n2*n3)
    %disp(size(U));
    %disp(size(V));
    %disp(size(S));
    result=TPRODp(3,TPRODp(3,C,U),R);
    %error_list_cur(j)=frob_norm(image-result)/frob_norm(image);
    % Display the image
    %imshow(result);
    
    % Generate the filename for this iteration
    filename = sprintf('image_%d.png', num_row_col(j));  % Example filename pattern
    
    % Save the image to a file
    imwrite(result, filename);  % Save as PNG format
end

%disp(error_list);
%disp(error_list_cur)
%plot(num_row_col, error_list_cur, 'o-', 'LineWidth', 2);

% Add labels and title
%xlabel('Number of retained row,columns each');
%ylabel('Relative error in approximation');
%title('Number of retained row/col vs Error');

% Add grid
grid on;