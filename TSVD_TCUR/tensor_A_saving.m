%saving our A 

% Open file for writing
fileID = fopen('tensor_A.txt', 'w');

% Write tensor elements to the file
for k = 1:size(A, 3)
    % Write slice header
    fprintf(fileID, 'Slice %d:\n', k);
    
    % Write slice elements
    for i = 1:size(A, 1)
        for j = 1:size(A, 2)
            fprintf(fileID, '%f ', A(i, j, k));
        end
        fprintf(fileID, '\n');
    end
end

% Close the file
fclose(fileID);