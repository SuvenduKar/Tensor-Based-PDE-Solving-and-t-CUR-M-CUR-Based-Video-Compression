function C=EIN_PROD4(A,B)
    szA=size(A);
    szB=size(B);
    if szA(3) ~=szB(1) || szA(4) ~= szB(2)
        error('Dimension mismatch')
    end
    C=zeros(szA(1),szA(2),szB(3),szB(4));
    for i=1:szA(1)
        for j=1:szA(2)
            for k=1:szB(3)
                for l=1:szB(4)
                    for m=1:szA(3)
                        for n=1:szA(4)
                            C(i,j,k,l)=C(i,j,k,l)+A(i,j,m,n)*B(m,n,k,l);
                        end
                    end
                end
            end
        end
    end