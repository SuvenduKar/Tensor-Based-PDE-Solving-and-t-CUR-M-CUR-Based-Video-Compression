% Gauss Jacobi(Elementwise) for 4th order tensor_function
function X=GaussJacobi4(A,B,X0,maxitr)
[m,n,p,q]=size(A);
itr=0;
X=X0;
while itr<maxitr
for i1=1:m
    for j1=1:n
        sum=0;
        for i2=1:m
            for j2=1:n
                if i1~=i2 || j1~=j2
                    sum=sum+A(i1,j1,i2,j2)*X0(i2,j2);
                end
            end
        end
    X0(i1,j1)=(1/A(i1,j1,i1,j1))*(B(i1,j1)-sum);
    end
end
itr=itr+1;
X=X0;
end
end