function [F] = diffusion_Ic(total_x,time_step,initial_condition,boundary_condition) 
%This function inputs the initial conditions for the diffusion solution in the final
%matrix, this allows the function to be used later
for j = 2:time_step%inputting boundary conditions
        F(1,j) = boundary_condition;%boundary conditions column 1
        F(total_x,j) = boundary_condition;%boundary conditions column nx
    end
    for i = 2:total_x-1%inputting initial conditions along row 1
        F(i,1) = initial_condition;
    end
    F(1,1) = initial_condition/2;%inputting initial condition at (1,1)
    F(total_x,1) = initial_condition/2;%inputting initial condition at (nx,1)
end

