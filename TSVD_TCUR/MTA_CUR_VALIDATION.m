clc
clear all
%A = randi([0, 2], 4, 4);
u = [1; 2; 4];
v = [4, 5, 6];
A=u*v;
disp('Matrix A is :');
disp(A)
[C,U,R]=MAT_CUR(A,1,1);

tria=C*U*R;
disp('The A-Approximation matrix is :' )
disp(A-tria);
