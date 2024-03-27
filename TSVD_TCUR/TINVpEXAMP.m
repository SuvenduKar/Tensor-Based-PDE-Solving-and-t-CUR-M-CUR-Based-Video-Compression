clc
clear all
format rat
A= randi([1,9],[4,4,5,6]);
%B=randi([1,9],[4,4,5,6]);
I=randi([0,0],[4,4,5,6]);
I(:,:,1,1)=eye(4);
%disp(TINVp(4,A));



% Display the random tensor
%disp('Random tensor A is:');
%disp(A);
%disp('Random tensor B is: ');
%disp(B);
disp('Their T product of A and its T inverse is: ');
disp(TPRODp(4,A,TINVp(4,A)));
