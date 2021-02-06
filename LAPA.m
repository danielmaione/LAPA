
nx = 100;
ny = 100; 
ni = 10000; 
V = zeros(nx,ny);

SideToZero = 0;

%for laplaces equation to work with the finite difference boundaries need
%to be declared in the x and y direction

%boundary condtion for x axis
%Top boundary for the equation in 2D 
V(:,nx)=0; 
%Bottom Boundary for the equation in 2D 
V(ny,:) = 0; 

%boundary condtion for x axis
%Left Boundry for the equation in 2D
V(1,:) = 1; 
%Right Boundry for the equation in 2D
V(:,1) = 0; 

%Now that all variables are established, calculate the finite difference
%and plot it

%Solving Laplace's equation Iteratively
for k = 1:ni
    for i = 2:nx-1
        for j = 2:ny-1
            %Use the finite difference equation by iteration and the
            %Boundry conditions
            V(i,j) = (1/4)*(V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1));  
        end
        if mod(k,50)==0
            figure(1);
            surf(V');
            title 'Plot of the 2D Laplace Transform'
            pause(0.05);
        end
    end
end

[Ex,Ey] = gradient(V);

figure(2)
quiver(-Ey',-Ex',1) 
title 'Plot of the Electric Field'

figure(3)
imboxfilt(V,3)
title 'Plot of the Vector Field'

