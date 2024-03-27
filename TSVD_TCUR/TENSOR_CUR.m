%{
function [C,U,R]=TENSOR_CUR(A,ROW_ORD,COL_ORD)
    
    szA=size(A);
    for i=1:szA(3)
        if ROW_ORD(i)>szA(1) || COL_ORD(i)>szA(2)
            disp('You are doing low rank approximation, so your number of columns as well as row used for approximation should be less than actual row and column number respectively ')
        end
    end
    C=zeros([szA(1),szA(2),szA(3)]);
    U=zeros([szA(2),szA(1),szA(3)]);
    R=zeros([szA(1),szA(2),szA(3)]);
    A=fft(A,[],3);

    for i=1:szA(3)
        [X,Y,Z]=MAT_CUR(A,COL_ORD(i),ROW_ORD(i));
        szX=size(X);
        szY=size(Y);
        szZ=size(Z);
        C([szX(1),szX(2),i])=X;
        U([szY(1),szY(2),i])=Y;
        C([szZ(1),szZ(2),i])=Z;
    end
    C=ifft(C,[],3);
    U=ifft(U,[],3);
    R=ifft(R,[],3);
%}
function [C, U, R] = TENSOR_CUR(A, d1, d2)
    % Input: A - a tensor of size n1 x n2 x n3
    %        d1 - sample size for rows
    %        d2 - sample size for columns
    
    A_tilde = fft(A,[],3);
    
    % Sample row index I and column index J
    %I = randsample(size(A,1), d1);
    %J = randsample(size(A,2), d2);
    
    C = zeros([size(A,1), d2, size(A,3)]);
    R = zeros([d1, size(A,2), size(A,3)]);
    U = zeros([d2,d1,size(A_tilde ,3)]);
    
    for k= 1:size(A_tilde ,3)
        C(:,:,k) = A_tilde(:,1:d2,k);
        R(:,:,k) = A_tilde(1:d1,:,k);
        U(:,:,k) = MAT_PSEUDOINV(A_tilde(1:d1,1:d2,k)); 
    end
    
    C = ifft(C,[],3); 
    R = ifft(R,[],3); 
    U = ifft(U,[],3); 
end

