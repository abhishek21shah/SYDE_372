clear all
close all
%% Section 2: Model Estimation - 1D case
% Load in data from 1st workspace
data1 = load('lab2_1.mat');
data_a = data1.a;
data_b = data1.b;

m_a = 5;
v_a = 1; % We are given std dev is 1, but std_dev^2 = var and 1^2 = 1 
l_b = 1;
xA = linspace(min(data_a),max(data_a),length(data_a)); % generates 100 evenly spaced points from min to max of data_a
xB = linspace(min(data_b),max(data_b),length(data_b));

% True densities for each data set
pdf_True_a = OneD_NormalDist(m_a, v_a, xA);
pdf_True_b = OneD_ExponenDist(l_b, xB);

% Section 2.1: Parametric - Gaussian
[mean_a, mean_b, var_a, var_b] = OneD_paraGaus(data1);
% Data Set A
pdf_Gaus_a = OneD_NormalDist(mean_a, var_a, xA);
figure(1);
plot(xA, pdf_True_a, 'b');
hold on;
plot(xA, pdf_Gaus_a, 'black');
title('1D Parametric - Gaussian for Data Set A')
legend('True p(x)','Estimated p(x)')
xlabel('x');
ylabel('Density');

% Data Set B
pdf_Gaus_b = OneD_NormalDist(mean_b, var_b, xB);
figure(2);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, pdf_Gaus_b, 'black');
title('1D Parametric - Gaussian for Data Set B')
legend('True p(x)','Estimated p(x)')
xlabel('x');
ylabel('Density');

% Section 2.2: Parametric - Exponential
% Data Set A
lambda_a = OneD_calcLambda(data_a);
pdf_Exp_a = OneD_ExponenDist(lambda_a, xA);
figure(3);
plot(xA, pdf_True_a, 'b');
hold on;
plot(xA, pdf_Exp_a, 'black');
title('1D Parametric - Exponential for Data Set A')
legend('True p(x)','Estimated p(x)')
xlabel('x');
ylabel('Density');

% Data Set B
lambda_b = OneD_calcLambda(data_b);
pdf_Exp_b = OneD_ExponenDist(lambda_b, xB);
figure(4);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, pdf_Exp_b, 'black');
title('1D Parametric - Exponential for Data Set B')
legend('True p(x)','Estimated p(x)')
xlabel('x');
ylabel('Density');

% Section 2.3: Parametric - Uniform
% Data Set A
[min_a, max_a] = OneD_uniParam(xA);
pdf_Uni_a = OneD_UniformDist(min_a, max_a, xA);
figure(5);
plot(xA, pdf_True_a, 'b');
hold on;
plot(xA, pdf_Uni_a, 'black');
title('1D Parametric - Uniform for Data Set A')
legend('True p(x)','Estimated p(x)')
xlabel('x');
ylabel('Density');

% Data Set B
[min_b, max_b] = OneD_uniParam(xB);
pdf_Uni_b = OneD_UniformDist(min_b, max_b, xB);
figure(6);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, pdf_Uni_b, 'black');
title('1D Parametric - Uniform for Data Set B')
legend('True p(x)','Estimated p(x)')
xlabel('x');
ylabel('Density');

% Section 2.4: Non-parametric
std_dev1 = 0.1;
std_dev2 = 0.4;
% Data Set A
parzen_a_sd1 = OneD_ParzenWindowEst(std_dev1, data_a, xA);
parzen_a_sd2 = OneD_ParzenWindowEst(std_dev2, data_a, xA);
figure(7);
plot(xA, pdf_True_a, 'b');
hold on;
plot(xA, parzen_a_sd1, 'black');
title('Non Parametric - Parzen for Data Set A with std dev = 0.1')
legend('True p(x)','Parzen with std dev = 0.1')
xlabel('x');
ylabel('Density');

hold off;
figure(8);
plot(xA, pdf_True_a, 'b');
hold on;
plot(xA, parzen_a_sd2, 'red');
title('Non Parametric - Parzen for Data Set A with std dev = 0.4')
legend('True p(x)','Parzen with std dev = 0.4')
xlabel('x');
ylabel('Density');

% Data Set B
parzen_b_sd1 = OneD_ParzenWindowEst(std_dev1, data_b, xB);
parzen_b_sd2 = OneD_ParzenWindowEst(std_dev2, data_b, xB);
figure(9);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, parzen_b_sd1, 'black');
title('Non Parametric - Parzen for Data Set B with std dev = 0.1')
legend('True p(x)','Parzen with std dev = 0.1')
xlabel('x');
ylabel('Density');

hold off;
figure(10);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, parzen_b_sd2, 'red');
title('Non Parametric - Parzen for Data Set B with std dev = 0.4')
legend('True p(x)','Parzen with std dev = 0.4')
xlabel('x');
ylabel('Density');

%% Section 3: Model Estimation - 2D Case
load('lab2_2.mat');

% Section 3.1: Parametric Estimation
% Find mean and Covariances of each class 
meanA= meanCalc(al); 
meanB= meanCalc(bl); 
meanC= meanCalc(cl); 
covA= covCalc(al); 
covB= covCalc(bl);
covC= covCalc(cl);

% Create meshgrid 
minX= min([al(:,1);bl(:,1);cl(:,1)])-1; 
maxX= max([al(:,1);bl(:,1);cl(:,1)])+1;
minY= min([al(:,2);bl(:,2);cl(:,2)])-1;
maxY= max([al(:,2);bl(:,2);cl(:,2)])+1;

x= minX:1:maxX; 
y= minY:1:maxY; 
[x1,y1]= meshgrid(x,y); 

% Get components of graph 
ML_ab= getMap(covA,covB,meanA',meanB',x1,y1); 
ML_ac= getMap(covA,covC,meanA',meanC',x1,y1); 
ML_bc= getMap(covB,covC,meanB',meanC',x1,y1); 

% Plot the results
Plot = ML_Classification(x1,y1,ML_ab,ML_ac,ML_bc);
Plot_Param_2d(x1, y1, Plot, at, bt, ct);

% Section 3.2: Non-Parametric Estimation
% Gaussian window, variance of 400
k = 400;
mean = [k/2 k/2];
covar = [400 0; 0 400];
step = 1;

min_x = min([min(al(:,1)), min(bl(:,1)), min(cl(:,1))]);
min_y = min([min(al(:,2)), min(bl(:,2)), min(cl(:,2))]);
max_x = max([max(al(:,1)), max(bl(:,1)), max(cl(:,1))]);
max_y = max([max(al(:,2)), max(bl(:,2)), max(cl(:,2))]);
res = [step min_x min_y max_x max_y];

[X1,Y1] = meshgrid(1:step:k);
window = mvnpdf([X1(:) Y1(:)], mean, covar);
window = reshape(window,length(Y1),length(X1));

[pdf_a, x_a, y_a] = parzen2(al,res, window);
[pdf_b, x_b, y_b] = parzen2(bl,res, window);
[pdf_c, x_c, y_c] = parzen2(cl,res, window);

[X2,Y2] = meshgrid(x_a, y_a);
[r, c] = size(X2);
ML_boundary = zeros(r, c);
for i = 1:r
   for j = 1:c
       [max_prob, class] = max([pdf_a(i,j), pdf_b(i,j), pdf_c(i,j)]);
       ML_boundary(i,j) = class;
   end
end

%plot non parametric estimation 
parametric_2d_plot(at, bt, ct, X2, Y2, ML_boundary) 


%% Section 4: Sequential Determinants
load('lab2_3.mat');

% Mesh grid for MED Classification
x1 = linspace(min([a(:,1);b(:,1)]), max([a(:,1);b(:,1)]), 100);
y1 = linspace(min([a(:,2);b(:,2)]), max([a(:,2);b(:,2)]), 100);

% Learn 3 sequential classifiers
sequential_classification(x1,y1,a,b,1,1);
sequential_classification(x1,y1,a,b,1,2);
sequential_classification(x1,y1,a,b,1,3);

% J = 5 with 20 iterations
sequential_classification(x1,y1,a,b,5,0);
