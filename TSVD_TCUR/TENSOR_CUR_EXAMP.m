clc
clear all
A = randi([0, 1], [2,3,3]);
ROW_ORD=[1,1,1];
COL_ORD=[1,1,1];
[C,U,R]=TENSOR_CUR(A,2,2);
disp(A-TPRODp(3,TPRODp(3,C,U),R));
