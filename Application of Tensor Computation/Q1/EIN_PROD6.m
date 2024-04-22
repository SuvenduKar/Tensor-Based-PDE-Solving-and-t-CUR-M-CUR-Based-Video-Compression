function C=EIN_PROD6(A,B)
    szA=size(A);
    szB=size(B);
    if szA(4) ~=szB(1) || szA(5) ~= szB(2) || szA(6)~=szB(3)
        error('Dimension mismatch')
    end
    C=zeros(szA(1),szA(2),szA(3),szB(4),szB(5),szB(6));
    for i=1:szA(1)
        for j=1:szA(2)
            for k=1:szA(3)
                for l=1:szB(4)
                    for m=1:szB(5)
                        for n=1:szB(6)
                            for p=1:szA(4)
                                for q=1:szA(5)
                                    for r=1:szA(6)
                                        C(i,j,k,l,m,n)=C(i,j,k,l,m,n)+A(i,j,k,p,q,r)*B(p,q,r,l,m,n);
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end