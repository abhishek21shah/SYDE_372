function [ML] = ML_Classification(x,y,ML_ab,ML_bc,ML_ca)
    ML = zeros(size(x,1), size(y,2));    
    for i = 1:size(x,1)
        for j = 1:size(y,2)
            if ML_ab(i,j) >= 0 && ML_bc(i,j) <= 0
                ML(i,j) = 1;
            elseif ML_bc(i,j) >= 0 && ML_ca(i,j) <= 0
                ML(i,j) = 2;
            elseif  ML_ca(i,j) >= 0 && ML_ab(i,j) <= 0
                ML(i,j) = 3;
            end
        end
    end
end