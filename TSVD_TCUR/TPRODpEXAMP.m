

clc
clear all
% Generate random tensor A
A= randi([1,9],[4,4,5,6]);
B=randi([1,9],[4,4,5,6]);
I=randi([0,0],[4,4,5,6]);
I(:,:,1,1)=eye(4);


% Display the random tensor
disp('Random tensor A is:');
disp(A);
%disp('Random tensor B is: ');
%disp(B);
disp('Their T product is: ');
disp(A-TPRODp(4,A,I));
disp