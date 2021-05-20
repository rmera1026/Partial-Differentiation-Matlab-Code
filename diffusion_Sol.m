function [diff_equation] = diffusion_Sol(total_x,time_step,diff_equation,I)
%Diffusion equation
for j = 2:time_step % for loop
    for i= 2:total_x-1 
    b(i-1,1) = (diff_equation(i-1,j-1)+ diff_equation(i+1,j-1)); %right side of equation
    end
X = I*b; % solve
    for z=1:total_x-2 % Place the solution into function
    diff_equation(z+1,j)=X(z,1);
    end
end
end

