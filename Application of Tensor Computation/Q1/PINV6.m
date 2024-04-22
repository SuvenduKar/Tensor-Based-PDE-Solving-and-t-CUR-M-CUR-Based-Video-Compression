function [U_inv,S_inv,V_inv]=PINV6(A)
% We will find the Pseudo inverse of 6th order tensor A
    szA=size(A);% Finding the size of A
    B=reshape(A,[szA(1)*szA(2)*szA(3),szA(4)*szA(5)*szA(6)]);%Reducing A to the equivalent matrix B through the homeomorphism 'reshape'
    [Um,Sm,Vm]=svd(B);%Getting the SVD of B
    % Getting the pseudoinverse Sm_pinv of diagonal matrix Sm,
    for i=1:min(size(Sm,1),size(Sm,2))
        if Sm(i,i) ~=0
            Sm(i,i)=1/Sm(i,i);
        else
            Sm(i,i)=Sm(i,i);
        end
    end
    % If SVD decomposition of B=Um*Sm*Vm', then its pseudoinverse is
    % B_pinv=Vm*Sm_pinv*Um'
    %Computing Um' to find pseudoinverse of B
    Um=Um';

    %Using Homeomorphism operation "reshape" getting U_inv,V_inv,S_inv such
    %that Pseudoinverse of A=V_inv *_3 S_inv *_3 U_inv
    U_inv=reshape(Um,[szA(4),szA(5),szA(6),szA(1),szA(2),szA(3)]);
    V_inv=reshape(Vm,[szA(4),szA(5),szA(6),szA(1),szA(2),szA(3)]);
    S_inv=reshape(Sm,[szA(1),szA(2),szA(3),szA(4),szA(5),szA(6)]);