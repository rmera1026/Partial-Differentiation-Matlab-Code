function [B] = b_Array(total_nodes,nodesPer_row,floatnode_row,top,bottom,left,right)
%B array for elliptical
%Boundary for B
for y=1:((total_nodes/nodesPer_row)-2)*((total_nodes/nodesPer_row-2))
    if y<(total_nodes/nodesPer_row)-1
        B(y,1)=left;
    elseif y>(floatnode_row-(total_nodes/nodesPer_row)+2)
        B(y,1)=right;
    elseif rem(y,(total_nodes/nodesPer_row)-2)==0
        B(y,1)=top;
    elseif rem(y,(total_nodes/nodesPer_row)-2)==1
        B(y,1)=0;% connected to ground
    end
end
% B array: boundary conditions for corners
B(1,1) = B(1,1)+bottom;%bottom left corner
B((total_nodes/nodesPer_row)-2,1)=B((total_nodes/nodesPer_row)-2,1)+top;%top left 
B(floatnode_row-((total_nodes/nodesPer_row)-3),1)=B(floatnode_row-((total_nodes/nodesPer_row)-3),1)+bottom;%bottom right 
B(floatnode_row,1)=B(floatnode_row,1)+top;%bottom left 
end

