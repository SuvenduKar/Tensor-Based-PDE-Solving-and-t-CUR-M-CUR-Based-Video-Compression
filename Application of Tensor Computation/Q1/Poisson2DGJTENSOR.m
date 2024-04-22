% Define the grid size
itr = [10,20,30,40,50,60,70,100,200,500,1000,2000,4000];
error_list=zeros(1,length(itr));
for k=1:length(itr)
    maxitr=itr(k);
    N=15;
    x = linspace(0, 1, N+2);
    y = linspace(0, 1, N+2);
    
    % Define the true solution
    [X, Y] = meshgrid(x, y);
    u_true = sin(pi*X) .* sin(pi*Y);
    
    % Define the step size
    dx = x(2) - x(1);
    dy = y(2) - y(1);
    
    
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
    B=kron(I,A)+kron(A,I);
    B=reshape(B,[N,N,N,N]);
    
    % Define the right-hand side function
    f = @(x, y) -2*pi^2*sin(pi*x).*sin(pi*y);
    F=zeros(N,N);
    
    for i=1:N
        for j=1:N
            F(i,j)=f(x(i+1),y(j+1));
        end 
    end
    F=-power(dx,2)*F;
    X0=zeros(N,N);
    result=GaussJacobi4(B,F,X0,maxitr);
    u=zeros(N+2,N+2);
    u(2:N+1,2:N+1)=result;

    % Plot the numerical solution
    figure;
    subplot(1, 2, 1);
    surf(X, Y, u);
    xlabel('x');
    ylabel('y');
    zlabel('u(x, y)');
    title('Numerical Solution');
    % Save the numerical solution plot
    
    
    % Plot the true solution
    subplot(1, 2, 2);
    surf(X, Y, u_true);
    xlabel('x');
    ylabel('y');
    zlabel('u(x, y)');
    title('True Solution');
    
    
    
    % Compute and display the difference between numerical and true solutions
    %error = norm(u - u_true, 'fro');
    error=norm(EIN_PROD42(B,result)-F,'fro');


    error_list(k)=error;
    disp(['Error between numerical and true solutions: ', num2str(error)]);
    saveas(gcf, 'poisson2DGJTensorPredicted.png');
end
disp(error_list);