function [F] = wave_Solution(total_x,time_step,dx,r)
%wave equation
for i = 2:total_x-1
    F(i,1) = sin(pi*(i-1)*dx);
end
%Boundary Conditions of wave equation
for j = 1:time_step
    F(1,j) = sin(0);
    F(total_x,j) = floor(sin(pi));
end
%wave equation inputted
%F(i,2)=(1-r)*F(i,1)+(r/2)*(F((i-1),1))+F((i+1),1))
for i=2:1:total_x-1
    F(i,2)=(1-r)*F(i,1)+(r/2)*(F((i-1),1)+F((i+1),1));
end

for j=2:1:time_step-1
    for i=2:1:total_x-1
        F(i,j+1)=2*(1-r)*F(i,j)+r*(F(i+1,j)+F(i-1,j))-F(i,j-1); %equation
    end
end
end

