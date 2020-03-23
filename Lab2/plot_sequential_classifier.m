% This function plots the sequential classifier
function plot_sequential_classifier(A,B,x1,y1,G,num)
    [X,Y] = meshgrid(x1,y1);
    figure; 
    title("Sequential Classifier " + num);
    hold on;
    scatter(A(:,1), A(:,2));
    scatter(B(:,1), B(:,2));
    contour(X, Y, G);
    xlabel('Feature 1'); 
    ylabel('Feature 2'); 
end