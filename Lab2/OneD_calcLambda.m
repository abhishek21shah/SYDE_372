function [lambda] = OneD_calcLambda(data)
dataSum = 0;
for x = 1:length(data)
    dataSum = dataSum + data(x);
end
lambda = length(data)/dataSum;
end

