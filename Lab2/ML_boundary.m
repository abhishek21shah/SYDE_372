function [ boundary ] = ML_boundary(mean_1, mean_2, covar_1,covar_2, X1, X2)
[r, c] = size(X1); 
boundary = zeros(r, c);
for i = 1:r
    for j = 1:c
    point = [X1(i,j), X2(i,j)];
    a = (point - mean_1) * inv(covar_1) * transpose(point - mean_1);
    b = (point - mean_2) * inv(covar_2) * transpose(point - mean_2);
    boundary(i,j) = b - a;
    end
end
end
