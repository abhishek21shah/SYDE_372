function [pdf] = OneD_ExponenDist(lambda, data)
for x=1:length(data)
    pdf(x) = lambda*exp(-lambda*data(x));

end

