function [discriminants, true_n_ab, true_n_ba] = build_discriminants(A,B,J)
    j = 1;
    discriminants = {};
    true_n_ab = {};
    true_n_ba = {};
    while true 
        while true 
            n_ba = 0;
            n_ab = 0;
            temp_a = [];
            temp_b = [];
            classA = zeros(size(A,1),1);
            classB = zeros(size(B,1),1);
     
            if (size(A,1) > 0)
                a_rand = ceil(rand * size(A,1));
                a_mu = A(a_rand,:); 
            end
            if (size(B,1) > 0)
                b_rand = ceil(rand * size(B,1)); 
                b_mu = B(b_rand,:); 
            end

            % Iterate class A
            for i=1:size(A,1)
                x = A(i,:);  
                classA(i) = MED(x(1),x(2),a_mu,b_mu);

                if (classA(i) == 2)
                    n_ab = n_ab + 1; 
                    temp_a(end+1,:) = x; 
                end
            end
            
            % Iterate class B
            for i=1:size(B,1)
                x = B(i,:);  
                classB(i) = MED(x(1),x(2),a_mu,b_mu);

                if (classB(i) == 1)
                   n_ba = n_ba + 1;
                   temp_b(end+1,:) = x;
                end
            end
            
            if (n_ab == 0 || n_ba == 0)
               if (n_ab == 0)
                   B = temp_b; 
               end
               if (n_ba == 0)
                   A = temp_a; 
               end
               break; 
            end
        end      
    
        discriminants = [discriminants, [a_mu; b_mu]];
        true_n_ab = [true_n_ab, n_ab];
        true_n_ba = [true_n_ba, n_ba];              
        
        if (J ~= 0 && j > J)
            break;
        end

        if (size(A,1) == 0 && size(B,1) == 0) 
            break;
        end

        j = j + 1;    
    end
end