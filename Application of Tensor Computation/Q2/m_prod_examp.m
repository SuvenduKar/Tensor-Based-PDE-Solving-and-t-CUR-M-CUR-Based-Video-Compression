A1=[4,-5,4;0,1,3];
A2=[6,3,15;1,2,1];
B1=[4,-5;0,1;4,6];
B2=[3,15;2,1;3,1];
A=zeros(2,3,2);
B=zeros(3,2,2);
B(:,:,1)=B1;
B(:,:,2)=B2;
A(:,:,1)=A1;
A(:,:,2)=A2;
%disp(A);

M=[1,2;1,0];

disp(kmode_product(facewise_product(kmode_product(A,M),kmode_product(B,M)),inv(M)));