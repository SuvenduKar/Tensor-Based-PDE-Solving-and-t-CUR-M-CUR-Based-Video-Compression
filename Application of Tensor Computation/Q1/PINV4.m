function [U_inv,S_inv,V_inv]=PINV4(A)
    szA=size(A);
    B=reshape(A,[szA(1)*szA(2),szA(3)*szA(4)]);
    [Um,Sm,Vm]=svd(B);
    for i=1:min(size(Sm,1),size(Sm,2))
        if Sm(i,i) ~=0
            Sm(i,i)=1/Sm(i,i);
        else
            Sm(i,i)=Sm(i,i);
        end
    end
    Um=Um';
    U_inv=reshape(Um,[szA(3),szA(4),szA(1),szA(2)]);
    V_inv=reshape(Vm,[szA(3),szA(4),szA(1),szA(2)]);
    S_inv=reshape(Sm,[szA(1),szA(2),szA(3),szA(4)]);


    