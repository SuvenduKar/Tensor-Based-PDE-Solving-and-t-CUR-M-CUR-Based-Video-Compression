function result =EIN_PROD42(A,B)
    szA=size(A);
    szB=size(B);
    if szA(3)~=szB(1) || szA(4)~=szB(2)
        error('Dimension mismatch')
    end
    C=zeros(szA(1),szA(2));
    for i=1:szA(1)
        for j=1:szA(2)
            for k=1:szA(3)
                for l=1:szA(4)
                    C(i,j)=C(i,j)+A(i,j,k,l)*B(k,l);
                end
            end
        end
    end
    result=C;
end