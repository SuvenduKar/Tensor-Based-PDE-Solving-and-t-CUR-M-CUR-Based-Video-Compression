function C=M_product(A,B,M)
    [n1,n2,n3]=size(A);
    [n4,n5,n6]=size(B);
    [n7,n8]=size(M);
    if n7 ~= n8||n6 ~=n8 || n3 ~= n8 || n2 ~= n4 || det(M)==0
        error('Dimension is incompatible as one or more of these occurred: n7 ~= n8||n6 ~=n8 || n3 ~= n8 || n2 ~= n4 || det(M)==0');
    end
    result1=kmode_product(A,M);
    result2=kmode_product(B,M);
    result3=facewise_product(result1,result2);
    C=kmode_product(result3,inv(M));