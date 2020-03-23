function sequential_classification(x1,y1,A,B,J,num)
    [discriminants, n_ab, n_ba] = build_discriminants(A,B,0);
    
    if (J == 1)
        lenX = numel(x1);
        lenY = numel(y1);
        [X,Y] = meshgrid(x1,y1);

        estimation = zeros(lenX,lenY); 
        for i = 1:lenX
           for j = 1:lenY
                estimation(i,j) = classify(J, X(i,j),Y(i,j), discriminants, n_ab, n_ba);
           end
        end
        plot_sequential_classifier(A,B,x1,y1,estimation,num);
    else         
        plot_errors(A,B,J,20); 
    end
end