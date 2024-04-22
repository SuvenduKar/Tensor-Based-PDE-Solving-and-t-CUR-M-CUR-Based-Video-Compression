

function [C, U, R] = TENSOR_TCUR(A, d1, d2)
    % Input: A - a tensor of size n1 x n2 x n3
    %        d1 - sample size for rows
    %        d2 - sample size for columns
    
    A_tilde = fft(A,[],3);
    s1=size(A,1);
    s2=size(A,2);
    s3=size(A,3);
    % Sample row index I and column index J
    I = sort(randsample(size(A,1), d1));
    J = sort(randsample(size(A,2), d2));
    
    C = zeros([size(A,1), d2, size(A,3)]);
    R = zeros([d1, size(A,2), size(A,3)]);
    U = zeros([d2,d1,size(A_tilde ,3)]);
    
    for k= 1:size(A_tilde ,3)
        C(:,:,k) = A_tilde(:,J,k);
        R(:,:,k) = A_tilde(I,:,k);
        U(:,:,k) = MAT_PSEUDOINV(A_tilde(I,J,k)); 
    end
    
    C = ifft(C,[],3); 
    R = ifft(R,[],3); 
    U = ifft(U,[],3); 
end

