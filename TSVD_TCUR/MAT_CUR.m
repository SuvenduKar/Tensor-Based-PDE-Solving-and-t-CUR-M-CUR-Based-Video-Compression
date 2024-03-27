function [C,U,R]=MAT_CUR(A,c,r)
    m=size(A,1);
    n=size(A,2);
    
    [col_sub,col_ind]=COL_SAMPLING_ALGO(A,c);
    C=col_sub;
    [row_sub,row_ind]=ROW_SAMPLING_ALGO(A,r);
    R=row_sub;
    U=A(row_ind,col_ind);
    U=MAT_PSEUDOINV(U);
    
    
