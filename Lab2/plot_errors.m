% This function determines the errors and plots them
function plot_errors(A,B,J,iterations)
    for j=1:J
        totalError = [];
        for k=1:iterations
            dataA = A;
            dataB = B;
            lenA = size(A,1);
            lenB = size(B,1);
            classA = zeros(size(A,1),1);
            classB = zeros(size(B,1),1);
            errorRate = 0;

            % Get classifiers 
            [discriminants,true_n_ab,true_n_ba] = build_discriminants(dataA,dataB,J);

            % Iterate through class A
            for i=1:lenA
                x = A(i,:);  
                classA(i) = classify(J,x(1),x(2),discriminants,true_n_ab,true_n_ba);

                if (classA(i) == 2)
                    errorRate = errorRate + 1; %increment for wrong classifications
                end
            end

            % Iterate through class B
            for i=1:lenB
                x = B(i,:);  
                classB(i) = classify(J,x(1),x(2),discriminants,true_n_ab,true_n_ba);

                if (classB(i) == 1)
                    errorRate = errorRate + 1; %increment for wrong classifications
                end
            end
            totalError(k) = errorRate/400;
        end
         
        avg_error(j) = mean(totalError);
        min_error(j) = min(totalError);
        max_error(j) = max(totalError);
        std_dev_error(j) = std2(totalError);       
    end
    
    figure;
    hold on;
    plot(avg_error,'DisplayName','Average error rate')
    plot(min_error,'DisplayName','Minimum error rate')
    plot(max_error,'DisplayName','Maximum error rate')
    plot(std_dev_error,'DisplayName','Standard deviation of error rate')
    legend;
    title("Error Rate of Sequential Classifier versus Number of Sequential Classifiers")
    xlabel("Number of Sequential Classifiers");
    ylabel("Error Rate");
end