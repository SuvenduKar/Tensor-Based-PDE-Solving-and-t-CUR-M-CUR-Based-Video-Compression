% clc
% clear all
% A=randi([1,1],5,5,5,5);
% %[U,S,V]=PINV4(A);
% %B=EIN_PROD4(EIN_PROD4(V,S),U);
% %disp(EIN_PROD4(B,A));
% X=randi([0,1],5,5);
% disp(X);
% B=EIN_PROD42(A,X);
% epsilon=0.0001;
% MAX=10000;
% Y=Jacobi4(A,B,epsilon,MAX);
% disp(Y);
% Define the grid for x, y, z
% Define the grid for x, y, z
% Define the fixed value of z
% Define the list of z values
z_values = [0.1, 0.2, 0.3];

% Define the function u(x,y,z)
u = @(x, y, z) sin(pi*x) .* sin(pi*y) .* sin(pi*z);

% Generate a grid of (x, y) values
[X, Y] = meshgrid(0:0.01:1, 0:0.01:1);

for i = 1:length(z_values)
    % Extract the current value of z
    z = z_values(i);

    % Evaluate u(x, y, z) for each point in the grid
    U = u(X, Y, z);

    % Plot (x, y) vs u
    surf(X, Y, U);
    xlabel('x');
    ylabel('y');
    zlabel('u');
    title(['Plot of u(x, y, ', num2str(z), ')']);

    % Save the plot as a PNG file
    %filename = sprintf('plot%d.png', i);
    %saveas(gcf, filename);

    % Close the current figure to avoid overlapping plots
    close(gcf);
end
