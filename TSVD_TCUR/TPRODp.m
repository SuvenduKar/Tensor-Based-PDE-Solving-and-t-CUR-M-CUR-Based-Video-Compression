function C =TPRODp (p,A, B)
    % Check if the Tensors are compatible for multiplication
    szA = size(A);
    szB = size(B);
    
    if szA(2)~=szB(1) || ~isequal(szA(3:end),szB(3:end))
        error('Tensor dimensions are not compatible for multiplication.');
    end
    
    % Compute the product
    t=1;

    for i=3:p
        t=t*szA(i);
        
    end
    

    for i =3:p
        A=fft(A,[],i);
        B=fft(B,[],i);
    end
    C=zeros([szA(1),szB(2),szB(3:p)]);

    for i=1:t
        C(:,:,i)=A(:,:,i)*B(:,:,i);
    end
  
    for i=p:-1:3
        C=ifft(C,[],i);
    end

end
