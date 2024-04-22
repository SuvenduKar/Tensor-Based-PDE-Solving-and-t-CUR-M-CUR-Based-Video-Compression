function X=Jacobi4(A,B,epsilon,MAX)
    A=full(A);
    N=size(A,1);
    X=zeros(N,N);
    X_prev=X;
    
    for k=1:MAX
        for i=1:N
            for j=1:N
                sum1=0;
                for p=1:N
                    for q=1:N
                        if p~=i && q~=j
                            sum1=sum1+A(i,j,p,q)*X(p,q);
                        end
                    end
                end
                X(i,j)=(1/A(i,j,i,j))*(B(i,j)-sum1);
            end
        end
        if norm(X-X_prev,'fro') <=epsilon
            break;
        end
        X_prev=X;
    end
end