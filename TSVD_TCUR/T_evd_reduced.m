function [U_ifft,S_ifft,U_inv_ifft] = T_evd_reduced(A,n)
    % Define your tensor A here (for example, A = rand(n1, n2, n3))
    % where n1, n2, and n3 are the dimensions of the tensor.
    %We will consider only first n singular values
    n1 = size(A, 1);
    n2 = size(A, 2);
    n3 = size(A, 3);
    if ~ n1==n2
        disp('Eigen value decomposition is not possible')
    end
    if n > min(n1, n2)
        disp('Change the number of eigen values you want to consider as it is exceeding the actual number.');
    end
    A=fft(A,[],3);

    U=zeros([n1,n1,n3]);
    S=zeros([n1,n1,n3]);
    U_inv=zeros([n1,n1,n3]);

    
    for i = 1:n3

        % Retain only the first n singular values
        [U(:,:,i),S(:,:,i)]=eig(A(:,:,i));
        U_inv(:,:,i)=MAT_PSEUDOINV(U(:,:,i));

    end
    S_temp=zeros(size(S));
    for i = 1:n3

        % Retain only the first n eigen values
        
        S_temp(1:n, 1:n, i) =S(1:n,1:n,i);
    end
    U_ifft=ifft(U,[],3);
    S_ifft=ifft(S_temp,[],3);
    U_inv_ifft=ifft(U_inv,[],3);