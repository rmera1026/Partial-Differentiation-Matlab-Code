function [I] = gaussian_Function(A,n)
%Finding the inverse of the A matrix using Gaussian Elimination
I(:,:)=0.0;
for j = 1:n
    for i =1:n
        if(i==j)
            I(i,j)=1;
        end
    end
end
for k = 1:n-1
    % Normalize row k
    factor = A(k,k);
    for i= 1:n
        I(k,i) = I(k,i)/factor;
        A(k,i) = A(k,i)/factor;
    end
    %Perform subtraction so that all row beneath row k, have the element in
    %column k equal to zero
    for m = k+1:n
        factor = A(m,k);
        for j = 1:n
            I(m,j) = I(m,j) - factor*I(k,j);
            A(m,j) = A(m,j) - factor*A(k,j);      
        end
    end
end

%Normalize the last row
factor = A(n,n);
for p = 1:n
   I(n,p) = I(n,p)/factor;
   A(n,p) = A(n,p)/factor; 
end

for z = n:-1:2
   %Perform subtraction so that all the rows above row z have the element
   %in column z equal to zero
  for h = z-1:-1:1
    factor = A(h,z); 
    for g = 1:n
      I(h,g) = I(h,g)-factor*I(z,g);
      A(h,g) = A(h,g)-factor*A(z,g);  
     end
  end
end 

