%Find mean and Covariances of each class 
meanA= meanCalc(al); 
meanB= meanCalc(bl); 
meanC= meanCalc(cl); 
covA= covCalc(al); 
covB= covCalc(bl);
covC= covCalc(cl);

%Create meshgrid 
minX= min([al(:,1);bl(:,1);cl(:,1)])-1; 
maxX= max([al(:,1);bl(:,1);cl(:,1)])+1;
minY= min([al(:,2);bl(:,2);cl(:,2)])-1;
maxY= max([al(:,2);bl(:,2);cl(:,2)])+1;

x= minX:1:maxX; 
y= minY:1:maxY; 
[x1,y1]= meshgrid(x,y); 

%Get components of graph 
ML_ab= getMap(covA,covB,meanA',meanB',x1,y1); 
ML_ac= getMap(covA,covC,meanA',meanC',x1,y1); 
ML_bc= getMap(covB,covC,meanB',meanC',x1,y1); 

%Plot the results
Plot = ML_Classification(x1,y1,ML_ab,ML_ac,ML_bc);
Plot_Param_2d(x1, y1, Plot, at, bt, ct);

