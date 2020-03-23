function Plot_Param_2d(x,y, map, A_Class, B_Class, C_Class)
    figure;
    A_Class = scatter(A_Class(:,1), A_Class(:,2));
    hold on;
    B_Class = scatter(B_Class(:,1), B_Class(:,2));
    hold on;
    C_Class = scatter(C_Class(:,1), C_Class(:,2));
    hold on;

    % Contour plot mapping of regions
    contour(x,y,map,[-100, 0]);
    % Decision boundary for MAP
    contour(x,y,map,1,'color', 'r');
    legend([A_Class B_Class C_Class],{'at', 'bt', 'ct'});
    title('2D-Parametric Estimation');
    xlabel('x axis');
    ylabel('y axis');
end