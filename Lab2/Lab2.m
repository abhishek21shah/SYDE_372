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

% Data Set B
pdf_Gaus_b = OneD_NormalDist(mean_b, var_b, xB);
figure(2);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, pdf_Gaus_b, 'black');
title('1D Parametric - Gaussian for Data Set B')
legend('True p(x)','Estimated p(x)')

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

% Data Set B
lambda_b = OneD_calcLambda(data_b);
pdf_Exp_b = OneD_ExponenDist(lambda_b, xB);
figure(4);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, pdf_Exp_b, 'black');
title('1D Parametric - Exponential for Data Set B')
legend('True p(x)','Estimated p(x)')

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

% Data Set B
[min_b, max_b] = OneD_uniParam(xB);
pdf_Uni_b = OneD_UniformDist(min_b, max_b, xB);
figure(6);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, pdf_Uni_b, 'black');
title('1D Parametric - Uniform for Data Set B')
legend('True p(x)','Estimated p(x)')

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
hold off;
figure(8);
plot(xA, pdf_True_a, 'b');
hold on;
plot(xA, parzen_a_sd2, 'red');
title('Non Parametric - Parzen for Data Set A with std dev = 0.4')
legend('True p(x)','Parzen with std dev = 0.4')

% Data Set B
parzen_b_sd1 = OneD_ParzenWindowEst(std_dev1, data_b, xB);
parzen_b_sd2 = OneD_ParzenWindowEst(std_dev2, data_b, xB);
figure(9);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, parzen_b_sd1, 'black');
title('Non Parametric - Parzen for Data Set B with std dev = 0.1')
legend('True p(x)','Parzen with std dev = 0.1')
hold off;
figure(10);
plot(xB, pdf_True_b, 'b');
hold on;
plot(xB, parzen_b_sd2, 'red');
title('Non Parametric - Parzen for Data Set B with std dev = 0.4')
legend('True p(x)','Parzen with std dev = 0.4')

%% Section 3: Model Estimation - 2D Case
load('lab2_2.mat');
%Section 3.1: Parametric Estimation

%Section 3.2: Non-Parametric Estimation

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
