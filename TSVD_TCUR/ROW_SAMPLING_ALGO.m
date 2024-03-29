function [A_row_sub,indices]=ROW_SAMPLING_ALGO(A,c)
    m=size(A,1);
    n=size(A,2);
    if c>m
        disp('Number of rows you want to consider exceeding total number of row')
    end
    p=zeros(size(A, 1), 1);
    indices=zeros(c,1);
    t=norm(A, 'fro')^2;
    for x=1:m
        p(x)=norm( A(x,:), 'fro')^2/t;
    end
    
    A_row_sub=zeros(c,n);
    i=1;
    while i<c+1
        [max_value, max_index] = max(p);
        indices(i)=max_index;
        A_row_sub(i,:)=A(max_index,:);
        p(max_index)=min(p)-i;
        i=i+1;
    end
    indices=sort(indices);
    A_row_sub=A( indices,:);