function [A] = elliptic_A(float_nodes,floatnode_row)
%Fill in A matrix for the laplace equation
for j=1:float_nodes
    for i = 1:float_nodes
        if j==i
            if i==1%If you need node 1
                A(i,j) = 4;
                A(i+1,j) = -1;
                A(i+floatnode_row,j) = -1;
            elseif i==floatnode_row
                A(i,j) = 4;
                A(i-1,j) = -1;
                A(i+floatnode_row,j) = -1;
            elseif i>1&&i<floatnode_row
                A(i,j) =4;
                A(i-1,j)=-1;
                A(i+1,j)=-1;
                A(i+floatnode_row,j)=-1;
            elseif rem(i,floatnode_row) == 1 && i <= float_nodes-floatnode_row && i > floatnode_row
                A(i,j) = 4;
                A(i+1,j) = -1;
                A(i+floatnode_row,j) = -1;
                A(i-floatnode_row,j) = -1;
            elseif rem(i,floatnode_row) == 0 && i < float_nodes && i > floatnode_row
                A(i,j) = 4;
                A(i-1,j) = -1;
                A(i+floatnode_row,j) = -1;
                A(i-floatnode_row,j) = -1;
            elseif i == float_nodes-(floatnode_row - 1)
                A(i,j) = 4;
                A(i+1,j) = -1;
                A(i-floatnode_row,j) = -1;
            elseif i == float_nodes
                A(i,j) = 4;
                A(i-1,j) = -1;
                A(i-floatnode_row,j) = -1;
            elseif i<float_nodes&&i>float_nodes-(floatnode_row-1)
                A(i,j) = 4;
                A(i-1,j) = -1;
                A(i+1,j) = -1;
                A(i-floatnode_row,j) = -1;
            else 
                A(i,j) = 4;
                A(i-1,j) = -1;
                A(i+1,j) = -1;
                A(i+floatnode_row,j) = -1;
                A(i-floatnode_row,j) = -1;
            end
        end
    end
end

end

