clc
clear all
A = randi([0, 0], [3,3,3]);
for i =1:3
    A(:,:,i)=i*eye(3);
end
disp(A)