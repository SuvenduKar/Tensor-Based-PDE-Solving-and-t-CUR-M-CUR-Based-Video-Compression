 A=rand(2,2,2,2,2,2);
 [U,S,V]=PINV6(A);
 B=EIN_PROD6(EIN_PROD6(V,S),U);
 disp(EIN_PROD6(A,B));
% disp(norm(EIN_PROD6(B,EIN_PROD6(A,B))-B,'fro'));
% disp(norm(EIN_PROD6(A,EIN_PROD6(B,A))-A,'fro'));
% disp(norm(ein_transpose(EIN_PROD6(A,B))-EIN_PROD6(A,B),'fro'));
% disp(norm(ein_transpose(EIN_PROD6(B,A))-EIN_PROD6(B,A),'fro'));
% clc
% clear all;
% N=3;
% A=zeros(N,N);
% A(1,1)=2;
% A(N,N)=2;
% A(1,2)=-1;
% A(N,N-1)=-1;
% for i=2:N-1
%     A(i,i-1)=-1;
%     A(i,i+1)=-1;
%     A(i,i)=2;
% end
% I=eye(N);
% B=kron(I,kron(A,I))+kron(I,kron(I,A))+kron(A,kron(I,I));
% disp(B);