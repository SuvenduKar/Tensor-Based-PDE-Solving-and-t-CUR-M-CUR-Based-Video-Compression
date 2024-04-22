function T=MAT_PSEUDOINV(A)


% Compute the SVD of A
[U, S, V] = svd(A);

% Calculate the pseudoinverse of the diagonal matrix S
S_pseudo_inv = zeros(size(S'));

for i=1:min(size(S))
    if ~ (S(i,i)==0)
        S_pseudo_inv(i,i)=1/S(i,i);
    end
    if S(i,i)==0
        S_pseudo_inv(i,i)=S(i,i);
    end
end

% Compute the pseudoinverse of A
A_pseudo_inv = V * S_pseudo_inv * U';

T=A_pseudo_inv;
