function parametric_2d_plot(a, b, c, X, Y, classifier)
    figure; 
    hold on;
    contour(X, Y, classifier, 'Color', 'k');
    
    class_a = scatter(a(:, 1), a(:, 2), 'g*');
    class_b = scatter(b(:, 1), b(:, 2), 'r+');
    class_c = scatter(c(:, 1), c(:, 2), 'b');
    
    title('Non-parametric estimation - Parzen window');
    xlabel('x') 
    ylabel('y')
    legend([class_a class_b class_c],{'at','bt','ct'});

end 