clc; clear; 
PDE = input('What PDE equation are you trying to use? \nEnter 1 for diffusion equation \nEnter 2 for wave equation \nEnter 3 for lapace equation: '); % storing users choice 
%% diffusion equaiotn
if (PDE == 1)
   %Inital conditions and boundary conditions for the diffusion option
    Length_rod = input ('Input the length of the rod [m]: ');% Length of rod 1
    dx = input ('Input the distance between each node [m]: ');% dx value
    r = 1; % r value is a constant 1
    dt = dx*dx*r;% distance in points in time
    total_time = input ('Input how long you would want the simulation to be [sec]: ');
    total_x = Length_rod/dx+1;
    time_step = total_time/dt+1;
    initial_condition = input('Input the initial conditions on the rod [celsius]: ');
    boundary_condition = input('Input the boundary conditions of the rod [celsius]: ');
    n = total_x-2; %nodes
F = diffusion_Ic(total_x,time_step,initial_condition,boundary_condition);%initial condition function
A = diff_Equation_A(n);
I = gaussian_Function(A,n);%gaussian function
F = diffusion_Sol(total_x,time_step,F,I);%final solution and store
end
%% wave equation
if (PDE == 2) 
 wave_length = input('What is the wave length? ');%wave Length choose 1
 dx = input('What is the distance between each node? '); % choose .2
 r = 1; % r is a constant of 1
 dt = dx*sqrt(r);% dt value
 total_time = input('What is the total time of simulation? '); %total time running the simulation needs to be able to provide a whle number when divided by dt
 total_x = (wave_length/dx+1);%total x
 time_step =(total_time/dt+1);% total timesteps
 F = wave_Equation(total_x,time_step,dx,r);%function for wave equation
end
%% Laplace equation
if(PDE == 3)
    total_nodes = input('Input the total number of nodes you want to calculate for: ');%total nodes = 4
    nodesPer_row = input('Input the number of nodes you want in each row: ');%input 1
    top = input('Input value of the top boundary: ')
    bottom = input('Input value of the bottom boundary: ');
    left = input('Input value of the left boundary: ');%left boundary, enter 10
    right = input('Input value of the right boundary: ');
    floatnode_row = (total_nodes/nodesPer_row)-2;%floating nodes in one row
    float_nodes = floatnode_row*floatnode_row;%total floating nodes
    A = elliptic_A(float_nodes,floatnode_row);% A matrix
    B = b_Array(total_nodes,nodesPer_row,float_nodes,top,bottom,left,right);% b array
    I = gaussian_Function(A,float_nodes);%inverse A
    X = I*B;%solves for floating nodes and have it equal to x
end
    
   