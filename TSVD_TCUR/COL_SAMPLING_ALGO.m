function [A_col_sub,indices]=COL_SAMPLING_ALGO(A,c)
    m=size(A,1);
    n=size(A,2);
    if c>n
        disp('Number of columns you want to consider exceeding total number of column')
    end
    p=zeros(size(A, 2), 1);
    indices=zeros(c,1);
    t=norm(A, 'fro')^2;
    for x=1:n
        p(x)=norm( A(:,x), 'fro')^2/t;
    end
    
    A_col_sub=zeros(m,c);
    i=1;
    while i<c+1
        [max_value, max_index] = max(p);
        indices(i)=max_index;
        A_col_sub(:,i)=A(:,max_index);
        p(max_index)=min(p)-i;
        i=i+1;
    end
    indices=sort(indices);
    A_col_sub=A(:, indices);





