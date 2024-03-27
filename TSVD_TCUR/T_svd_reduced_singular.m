function [U_ifft,S_ifft,V_ifft] = T_svd_reduced_singular(A,n)
    % Define your tensor A here (for example, A = rand(n1, n2, n3))
    % where n1, n2, and n3 are the dimensions of the tensor.
    %We will consider only first n singular values
    n1 = size(A, 1);
    n2 = size(A, 2);
    n3 = size(A, 3);
    if n > min(n1, n2)
        disp('Change the number of singular values you want to consider as it is exceeding the actual number.');
    end
    [U,S,V]=tsvd(A);

    S_temp = S;


    % Compute SVD for each slice of the tensor
    for i = 1:n3

        % Retain only the first n singular values
        S(:,:,i)=zeros(n1,n2);
        S(1:n, 1:n, i) =S_temp(1:n,1:n,i);
    end
    U_ifft=U;
    S_ifft=S;
    V_ifft=V;





