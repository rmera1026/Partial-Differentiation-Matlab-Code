function [A] = diff_Equation_A(n)
% make A matrix for Diffusion
for j =1:n
    for i =1:n
        if (j == i) 
           A(i,j)=4;
        end
        if (i == (j+1))
            A(i,j)=-1;
        end
        if (i ==(j-1))
          A(i,j)=-1;
        end     
    end
end
end

