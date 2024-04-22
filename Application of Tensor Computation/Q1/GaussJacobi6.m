% Gauss Jacobi(Elementwise) for 6th order tensor_function
function X=GaussJacobi6(A,B,X0,maxitr)
[m,n,o,p,q,r]=size(A);
itr=0;
X=X0;
while itr<maxitr
for i1=1:m
    for j1=1:n
        for k1=1:o
            sum=0;
            for i2=1:m
                for j2=1:n
                    for k2=1:o
                        if i1~=i2 || j1~=j2 ||k1 ~=k2
                            sum=sum+A(i1,j1,k1,i2,j2,k2)*X0(i2,j2,k2);
                        end
                    end
                end
            end
            X0(i1,j1,k1)=(1/A(i1,j1,k1,i1,j1,k1))*(B(i1,j1,k1)-sum);
        end
    
    end
end
itr=itr+1;
X=X0;
end
end