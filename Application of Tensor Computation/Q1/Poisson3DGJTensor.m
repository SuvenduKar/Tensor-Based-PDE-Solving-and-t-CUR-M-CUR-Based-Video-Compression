% Define the number of maximum iteration
itr = [10,20,30,40,50,60,70,100,200,500,1000,2000];
error_list=zeros(1,length(itr));
for h=1:length(itr)
    N=15;
    maxitr=itr(h);
    x = linspace(0, 1, N+2);
    y = linspace(0, 1, N+2);
    z = linspace(0, 1, N+2);
    
    % Define the true solution
    [X, Y, Z] = meshgrid(x, y, z);
    %u_true = sin(pi*X) .* sin(pi*Y) .* sin(pi*Z);
    u_true=zeros((N+2)^3,1);
    t=1;
    for i=1:N+2
        for j=1:N+2
            for k=1:N+2
                u_true(t,1)=sin(pi*x(i))*sin(pi*y(j))*sin(pi*z(k));
                t=t+1;
            end
        end
    end
    u_true=reshape(u_true,[N+2,N+2,N+2]);
    
    
    % Define the step size
    dx = x(2) - x(1);
    dy = y(2) - y(1);
    dz = z(2) - z(1);
    
    
    A=zeros(N,N);
    A(1,1)=2;
    A(N,N)=2;
    A(1,2)=-1;
    A(N,N-1)=-1;
    for i=2:N-1
        A(i,i-1)=-1;
        A(i,i+1)=-1;
        A(i,i)=2;
    end
    I=eye(N);
    B=kron(kron(I,I),A)+kron(kron(I,A),I)+kron(kron(A,I),I);
    B=reshape(B,[N,N,N,N,N,N]);
    
    % Define the right-hand side function
    f = @(x, y,z) -3*power(pi,2)*sin(pi*x).*sin(pi*y)*sin(pi*z);
    
    F=zeros(N^3,1);
    l=1;
    for i=1:N
        for j=1:N
            for k=1:N
                F(l,1)=f(x(i+1),y(j+1),z(k+1));
                l=l+1;
            end
        end 
    end
    F=reshape(F,[N,N,N]);
        
    F=-power(dx,2)*F;
    X0=zeros(N,N,N);
    result=GaussJacobi6(B,F,X0,maxitr);
    u=zeros(N+2,N+2,N+2);
    u(2:N+1,2:N+1,2:N+1)=result;
    % Compute and display the difference between numerical and true solutions
    error=norm(EIN_PROD63(B,result)-F,'fro');
    error_list(h)=error;
    disp(['Error between numerical and true solutions: ', num2str(error)]);
    

    num_slice=2;
    z_val=z(num_slice);

    [Xh, Yh] = meshgrid(x, y);

    % Plot (x, y) vs u
    % % Plot the numerical solution
    figure;
    subplot(1, 2, 1);
    surf(Xh, Yh,u(:,:,num_slice));
    xlabel('x');
    ylabel('y');
    zlabel('u_pred');
    title(['Plot of u_pred(x, y, ', num2str(z_val), ')']);

    % % Plot the True solution
   
    subplot(1, 2, 2);
    surf(Xh, Yh,u_true(:,:,num_slice));
    xlabel('x');
    ylabel('y');
    zlabel('u_true');
    title(['Plot of u_true(x, y, ', num2str(z_val), ')']);

    % Save the plot as a PNG file
    filename = sprintf('Poisson3DGJTensor%d.png', itr(h));
    saveas(gcf, filename);

    % Close the current figure to avoid overlapping plots
    close(gcf);
  
end
disp(error_list)
    

