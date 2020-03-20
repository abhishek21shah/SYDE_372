function [pdf] = OneD_NormalDist(mean, var, data)
for x = 1:length(data)    
    pdf(x) = 1/sqrt(2*pi*var)*exp(((data(x)-mean)^2)/(-2*var));
end
end

