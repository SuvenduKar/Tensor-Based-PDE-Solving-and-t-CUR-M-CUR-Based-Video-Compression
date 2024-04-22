function result =EIN_PROD63(A,B)
    szA=size(A);
    szB=size(B);
    if szA(4)~=szB(1) || szA(5)~=szB(2)|| szA(6)~=szB(3)
        error('Dimension mismatch')
    end
    C=zeros(szA(1),szA(2),szA(3));
    for i=1:szA(1)
        for j=1:szA(2)
            for k=1:szA(3)
                for l=1:szB(1)
                    for m=1:szB(2)
                        for n=1:szB(3)
                            C(i,j,k)=C(i,j,k)+A(i,j,k,l,m,n)*B(l,m,n);
                        end
                    end
                end
            end
        end
    end
    result=C;
end