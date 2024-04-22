
num_row_col=[50,100,300,500,700,900];
error_list_cur=zeros(1,length(num_row_col));
Times=zeros(1,length(num_row_col));
for j=1:length(num_row_col)
    % Define the folder paths
    imageFolder = 'videoframes';  % Folder containing the images
    curFolder = sprintf('curframes%d',num_row_col(j));    % Folder to save the CUR decomposition results
    % Create the output folder if it doesn't exist
    if ~exist(curFolder, 'dir')
        mkdir(curFolder);
    end
    
    % Get a list of image files in the imageFolder
    imageFiles = dir(fullfile(imageFolder, 'frame_*.png'));
    % Loop through each image file
    trial_error=zeros(1,length(imageFiles));
    trial_time=zeros(1,length(imageFiles));
    for i = 1:length(imageFiles)

        % Read the image
        
        % Read the image
        %imagePath = fullfile(imageFolder, imageFiles(i).name);
        %image = imread(imagePath);
        %image = imresize(image, [256, 256]);
        
        image = imread(sprintf('videoframes/frame_%d.png',i));


        % Convert the image to double precision
        image = im2double(image);

        % Get the dimensions of the image
        %[m, n, ~] = size(image);  % RGB image has three channels
        
        % Reshape the image into a matrix where each column represents a pixel
        %X = reshape(image, [], 3);  % Reshape to m*n-by-3 matrix

      % Apply the TENSOR_TCUR function to perform CUR decomposition
        tic;
        [C, U, R] = TENSOR_TCUR(image,num_row_col(j),num_row_col(j));
        
        result=T_product(T_product(C,U),R);
        t=toc;
        trial_error(i)=frob_norm(result-image)/frob_norm(image);
        trial_time(i)=t;
        %result = uint8(result*255);
        %tensor=result;
        %curImage = reshape(tensor, size(tensor, 1), size(tensor, 2), size(tensor, 3));
        % Generate the filename for this iteration
       
        curFilename = sprintf('cur_%d.png', i);
        % Save the image to a file
        imwrite(result, fullfile(curFolder, curFilename));  % Save as PNG format
        %save(fullfile(curFolder, curFilename)); % Save the results
        %trial_error(i)=frob_norm(result-image)/frob_norm(image);
    end
    error_list_cur(j)=mean(trial_error);
    Times(j)=mean(trial_time);
end
disp('Error list is');
disp(error_list_cur);
disp('Time taken:');
disp(Times);
disp('CUR decomposition completed and results saved.');
