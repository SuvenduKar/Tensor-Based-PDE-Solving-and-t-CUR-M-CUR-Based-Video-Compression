clc
clear all
format rat
A= randi([1,9],[4,4,2,2]);
%B=randi([1,9],[4,4,5,6]);
I=randi([0,0],[4,4,5,6]);
I(:,:,1,1)=eye(4);
%disp(TINVp(4,A));



% Display the random tensor
%disp('Random tensor A is:');
%disp(A);
%disp('Random tensor B is: ');
%disp(B);
disp('Check result : ');
tic
disp(A-TTRANSp(4,TTRANSp(4,A)));
toc
