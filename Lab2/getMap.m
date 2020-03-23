function [Plot]= getMap(covA,covB,meanA,meanB,X,Y)

horiz= size(X,1); 
vert= size(Y,2); 
Plot= zeros(horiz, vert);
invA= inv(covA); 
invB= inv(covB);

A= invA - invB; 
B= 2*(meanB*invB - meanA*invA); 
C= meanA*invA*meanA' - meanB*invB*meanB'; 

    for i=1:horiz
        for j=1:vert
            Boundary = [X(i,j),Y(i,j)]; 
            Plot(i,j)= Boundary * A * (Boundary)' + B * (Boundary)' + C; 
        end
    end
end