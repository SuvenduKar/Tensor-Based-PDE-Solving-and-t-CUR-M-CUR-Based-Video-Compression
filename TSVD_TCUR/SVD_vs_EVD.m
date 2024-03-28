clc
clear all
n_val=[100,200,300,400,500];
for i=1:length(n_val)
    A= randi([1,9],[n_val(i),n_val(i),n_val(i)]);
    fprintf('Time taken for SVD with n=%d',n_val(i));
    tic;
    [U,S,V]=T_svd_reduced_singular(A,0.2*n_val(i));
    toc;
    fprintf('Error while considering only 0.2 portion of singular values with n=%d',n_val(i));
    result=TPRODp(3,TPRODp(3,U,S),V);
    error=frob_norm(A-result)/frob_norm(A);
    disp(error);
    fprintf('Time taken for EVD with n=%d',n_val(i));
    tic;
    [E,F,G]=T_evd_reduced(A,0.2*n_val(i));
    toc;
    fprintf('Error while considering only 0.2 portion of eigen values with n=%d',n_val(i));
    result1=TPRODp(3,TPRODp(3,E,F),G);
    error1=frob_norm(A-result1)/frob_norm(A);
    disp(error1);
end


