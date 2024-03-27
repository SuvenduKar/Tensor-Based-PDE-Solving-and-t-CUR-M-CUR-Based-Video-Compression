function result=frob_norm(A)
[n1,n2,n3]=size(A);
result1=0;
for i=1:n1
    for j=1:n2
        for k=1:n3
            result1=result1+(A(i,j,k)*A(i,j,k));
        end
    end
end
result=sqrt(result1);


