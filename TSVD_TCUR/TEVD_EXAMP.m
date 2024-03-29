clc
clear all
format rat
A= randi([1,9],[4,4,5]);
[U,S,V]=T_evd_reduced(A,4);
result=TPRODp(3,TPRODp(3,U,S),V);
disp(A-result);